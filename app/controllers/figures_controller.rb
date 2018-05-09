class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    erb :'/figures/edit'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(params[:figure])
    redirect to '/figures'
  end

  post '/figures/:id' do

  end

end
