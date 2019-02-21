class FiguresController < ApplicationController

  get '/figures' do
      @figures = Figure.all
      erb :'figures/index'
  end

  get '/figures/new' do
      @landmarks = Landmark.all
      erb :'figures/new'
  end

end
