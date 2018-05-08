class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  post '/figures' do
    figure = Figure.create(name: params[:figure][:name])
    
    if params[:title][:name] != ""
      figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:figure][:title_ids].nil?
      params[:figure][:title_ids].each do |id|
        figure.titles << Title.find(id)
      end
    end

    if params[:landmark][:name] != ""
      landmark = Landmark.create(
        name: params[:landmark][:name],
        year_completed: params[:landmark][:year_completed]
      )

      figure.landmarks << landmark
    end

    if !params[:figure][:landmark_ids].nil?
      params[:figure][:landmark_ids].each do |id|
        figure.landmarks << Landmark.find(id)
      end
    end

    figure.save

    redirect :"figures/#{figure.id}"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]
    
    if params[:title][:name] != ""
      figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:figure][:title_ids].nil? && !params[:figure][:title_ids].empty?
      params[:figure][:title_ids].each do |id|
        figure.titles << Title.find(id)
      end
    end

    if params[:landmark][:name] != ""
      landmark = Landmark.create(
        name: params[:landmark][:name],
        year_completed: params[:landmark][:year_completed]
      )

      figure.landmarks << landmark
    end

    if !params[:figure][:landmark_ids].nil? && !params[:figure][:landmark_ids].empty?
      params[:figure][:landmark_ids].each do |id|
        figure.landmarks << Landmark.find(id)
      end
    end

    figure.save

    redirect :"figures/#{figure.id}"
  end

end
