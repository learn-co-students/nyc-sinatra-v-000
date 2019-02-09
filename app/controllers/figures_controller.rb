class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.title = Title.find_or_create_by(params[:title])
    binding.pry
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end
end
