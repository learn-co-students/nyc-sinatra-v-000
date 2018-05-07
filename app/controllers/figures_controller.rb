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


  post '/figures' do
    puts params
#binding.pry
    @figure = Figure.create(params["figure"])
#binding.pry
    if !params["title"]["name"].empty?
    @title = Title.create(params[:title])
    @figure.titles << @title
    end

    if  !params["figure"]["name"].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end

    @figure.save
    redirect
  end

end
