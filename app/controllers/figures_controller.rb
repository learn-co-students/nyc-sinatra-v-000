class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
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
    @titles = []
    @landmarks = []
    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |id|
        @titles << Title.find_by(id: id)
      end
      @figure.titles << @titles
    end
    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |id|
        @landmarks << Landmark.find_by(id: id)
      end
      @figure.landmarks << @landmarks
    end
    if params[:title][:name] != nil
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end
    if params[:landmark][:name] != nil
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
      @figure.save
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @titles = []
    @landmarks = []
    if params[:figure][:name] != nil
      @figure.name = params[:figure][:name]
    end
    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |id|
        @titles << Title.find_by(id: id)
      end
      @figure.titles << @titles
    end
    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |id|
        @landmarks << Landmark.find_by(id: id)
      end
      @figure.landmarks << @landmarks
    end
    if params[:title][:name] != nil
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end
    if params[:landmark][:name] != nil
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
      @figure.save
      redirect "/figures/#{@figure.id}"
  end
end
