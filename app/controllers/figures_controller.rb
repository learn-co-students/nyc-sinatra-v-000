class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    #binding.pry
    #@figure.title_ids = params[:title_ids]
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end   
    @figure.save
  end

end
