class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      @title = Title.find_or_create_by(:name => params["title"]["name"])
      @figure.titles << @title
   end
    @landmark = Landmark.find_or_create_by(:name => params["landmark"]["name"])
    @figure.landmarks << @landmark
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params["figure"])
    if !params["title"]["name"].empty?
      @title = Title.find_or_create_by(:name => params["title"]["name"])
      @figure.titles << @title
   end
    @landmark = Landmark.find_or_create_by(:name => params["landmark"]["name"])
    @figure.landmarks << @landmark
    redirect to "/figures/#{@figure.id}"
  end
end
