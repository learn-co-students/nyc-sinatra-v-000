class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures' do
    #binding.pry
    @titles = Title.all
    @landmarks = Landmark.all
    binding.pry
    @figure = Figure.create(params[:figure])

    @figure.save

    #binding.pry
  end

end
