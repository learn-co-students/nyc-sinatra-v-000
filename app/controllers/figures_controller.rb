class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :new
  end
end
