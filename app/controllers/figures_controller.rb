require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    binding.pry
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end


end
