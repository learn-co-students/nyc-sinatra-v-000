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

  post '/figures' do
    figure = Figure.find_or_create_by(params["figure"])
    binding.pry
    figure.titles << Title.find_or_create_by(params["title"])
    figure.landmarks << Landmark.find_or_create_by(params["landmark"])
    figure.save

    redirect :"/figures/#{"whatever"}"
  end


end
