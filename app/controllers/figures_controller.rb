class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    erb :'/figures/index'
  end


  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do

    @figure = Figure.create(name: params[:figure][:name])

    if params[:figure][:title_ids] != nil
      @figure.titles = Title.find(params[:figure][:title_ids])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if params[:figure][:landmark_ids] != nil
      @figure.landmarks = Landmark.find(params[:figure][:landmark_ids])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
    end

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])

    if !params[:figure][:name].empty?
      @figure.name = params[:figure][:name]
    end

    if params[:figure][:title_ids] != nil
      @figure.titles = Title.find(params[:figure][:title_ids])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if params[:figure][:landmark_ids] != nil
      @figure.landmarks = Landmark.find(params[:figure][:landmark_ids])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
    end

    @figure.save

    erb :'/figures/show'

  end
end
