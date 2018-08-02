class FiguresController < ApplicationController

  get '/figures' do
    redirect '/figures/new'
  end

  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

end
