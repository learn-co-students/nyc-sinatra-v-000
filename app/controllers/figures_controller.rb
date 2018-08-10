class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures/new' do
    @fig = Figure.new(name: params[:figure][:name])
    if !!params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        @title = Title.find(id)
        @fig.titles << @title
      end
    end
    if params[:title][:name] != ""
      @title2 = Title.new(name: params[:title][:name])
      @fig.titles << @title2
    end
    if !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        @land = Landmark.find(id)
        @fig.landmarks << @land
      end
    end
    if params[:landmark][:name] != ""
      @land2 = Landmark.new(name: params[:landmark][:name])
      @fig.landmarks << @land2
    end
    @fig.save
    redirect "/figures/#{@fig.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    if params[:figure][:name] != ""
      @figure.name = params[:figure][:name]
    end

    if !params[:figure][:landmark_ids]
      @figure.landmarks = []
    else
      @figure.landmark_ids = params[:figure][:landmark_ids]
    end
    if params[:landmark][:name] != ""
      @landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end

    if !params[:figure][:title_ids]
      @figure.titles = []
    else
      @figure.title_ids = params[:figure][:title_ids]
    end
    if params[:title][:name] != ""
      @title = Title.find_or_create_by(name: params[:title][:name])
      @figure.titles << @title
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @fig = Figure.find(params[:id])
    erb :'/figures/show'
  end
end
