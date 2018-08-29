require 'pry'

class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    # binding.pry
    @figure.title = Title.find_or_create_by(:name => params[:title][:name])

    redirect to ('/figures/:id')
  end
end
