class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title][:name]
      @title = Title.create(name: params[:title][:name])
      @figure.titles.push(@title)
    end
    if params[:landmark][:name]
      @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
      @figure.landmarks.push(@landmark)
    end
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:title][:name]
      @title = Title.create(name: params[:title][:name])
      @figure.titles.push(@title)
    end
    if params[:landmark][:name]
      @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
      @figure.landmarks.push(@landmark)
    end
    redirect "/figures/#{@figure.id}"
  end

end
