class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @title = Title.all
    @landmark = Landmark.all
    erb :'/figures/new'
  end



end
