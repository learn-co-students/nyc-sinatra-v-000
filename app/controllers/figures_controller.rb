class FiguresController < ApplicationController

  get '/figures/new' do

    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    binding.pry
    erb :'/figures/new'
  end

  post '/figures' do
    binding.pry
  end

end
