class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do

    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    titles =[]
    if params[:title][:name] != ""
        titles << Title.create(name: params[:title][:name])
    end
    if params[:figure][:title_ids] && !params[:figure][:title_ids].empty?
        params[:figure][:title_ids].each do |id|
          titles << Title.find_by_id(id)
      end
    end

    landmarks =[]
    if params[:landmark][:name] != ""
        landmarks << Landmark.create(name: params[:landmark][:name])
    end
    if  params[:figure][:landmark_ids] && !params[:figure][:landmark_ids].empty?
        params[:figure][:landmark_ids].each do |id|
          landmarks << Landmark.find_by_id(id)
      end
    end
    @figure = Figure.create(titles: titles, name: params[:figure][:name], landmarks: landmarks)
    redirect to "/figures/#{@figure.id}"
  end


  post '/figures' do

  end

  get '/figures/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'figres/edit'
  end
end
