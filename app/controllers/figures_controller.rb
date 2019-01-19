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
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarkss << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end
end
