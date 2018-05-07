class FiguresController < ApplicationController

  get '/figures' do
      @figures = Figure.all
      erb :'figures/index'
    end

  get '/figures/new' do

    erb :'figures/new'
  end

  post '/figures' do
    puts params
#binding.pry
    @figure = Figure.create(params["figure"])
    if !params["title"]["name"].empty?
    @title = Title.create(params[:title][:name])
    @figure.titles << @title
    end
    if  !params["figure"]["name"].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    @figure.save
    #binding.pry
  end

end
