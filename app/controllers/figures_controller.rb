class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    #binding.pry
    erb :'/figures/show'
  end

end
