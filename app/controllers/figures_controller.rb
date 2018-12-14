class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures/show' do
    @figure = Figure.create(name: params[:figure][:name])
    # erb :'/figures/show'
  end

  get '/figures/show' do
    # @figure = Figure.find_by(name: params[:figure][:name])
    erb :'/figures/show'
  end




end
