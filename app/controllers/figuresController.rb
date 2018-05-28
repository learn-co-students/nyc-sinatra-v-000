class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
  #  @figure.landmark_ids = params[:landmarks]
    if params[:landmark][:name]
      @figure.landmarks << Landmark.new(params[:landmark])
    end
  #  @figure.title_ids = params[:titles]
    if params[:title][:name]
      @figure.titles << Title.new(params[:title])
    end
    @figure.save
    erb :'figures/show'
  end
end
