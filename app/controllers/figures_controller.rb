class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:landmark]
      @landmark = Landmark.find_or_create_by(params[:landmark])
      @figure.landmarks << @landmark
    end
    if params[:title]
      @title = Title.find_or_create_by(params[:title])
      @figure.titles << @title
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if params[:landmark]
      @landmark = Landmark.find_or_create_by(params[:landmark])
      @figure.landmarks << @landmark
    end
    if params[:title]
      @title = Title.find_or_create_by(params[:title])
      @figure.titles << @title
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
