class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end

  post '/figures/new' do
    @figure = Figure.create(params[:id])
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure][:name])
    @landmark = Landmark.find_or_create_by(params[:landmark][:name])
    @figure.landmark = @landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
