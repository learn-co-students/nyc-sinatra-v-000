require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(name: params[:name])
    redirect "/figures/#{@figure.id}"
  end


  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end
end
