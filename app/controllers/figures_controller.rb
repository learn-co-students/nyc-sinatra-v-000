class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figure = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
          binding.pry
      @figure.titles << Title.create(params[:title])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end
end
