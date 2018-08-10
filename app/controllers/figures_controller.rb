class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do

    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    redirect to "/figures/#{@figure.id}"
  end




  get '/figures/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'figres/edit'
  end
end
