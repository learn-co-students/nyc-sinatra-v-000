class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name], title_ids: params[:figure][:title_ids], landmark_ids: params[:figure][:landmark_ids])

    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.title_ids = @title.id
      @title.save
    end

    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      @figure.landmark_ids = @landmark.id
      @landmark.save
    end

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.title_ids = @title.id
      @title.save
    end

    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      @figure.landmark_ids = @landmark.id
      @landmark.save
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end
end
