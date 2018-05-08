class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(params[:figure])
    @figure.titles = Title.find_or_create_by(params[:title])
    @figure.save
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    redirect "/figures/#{@figure.id}"
  end
end
