class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure]["name"])

    if !params[:title]["name"].empty?
      title = Title.find_or_create_by(:name => params[:title]["name"])
      title.figures << @figure
      title.save
    elsif !params[:figure]["title_ids"].nil?
      params[:figure]["title_ids"].each do |id|
      title = Title.find_by_id(id)
      title.figures << @figure
      title.save
      end
    else
    end
    if !params[:landmark]["name"].empty?
      landmark = Landmark.find_or_create_by(:name => params[:landmark]["name"])
      @figure.landmarks << landmark
    elsif !params[:figure]["landmark_ids"].nil?
      params[:figure]["landmark_ids"].each do |id|
      landmark = Landmark.find_by_id(id)
      @figure.landmarks << landmark
      end
    else
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(:name => params[:figure]["name"])
    if !params[:title]["name"].empty?
      title = Title.find_or_create_by(:name => params[:title]["name"])
      title.figures << @figure
      title.save
    elsif !params[:figure]["title_ids"].nil?
      params[:figure]["title_ids"].each do |id|
      title = Title.find_by_id(id)
      title.figures << @figure
      title.save
      end
    else
    end
    if !params[:landmark]["name"].empty?
      landmark = Landmark.find_or_create_by(:name => params[:landmark]["name"])
      @figure.landmarks << landmark
    elsif !params[:figure]["landmark_ids"].nil?
      params[:figure]["landmark_ids"].each do |id|
      landmark = Landmark.find_by_id(id)
      @figure.landmarks << landmark
      end
    else
    end
    @figure.save

    redirect to "figures/#{@figure.id}"
  end
end
