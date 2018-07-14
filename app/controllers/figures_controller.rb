class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:id])
    @figure.save
    erb :'figures/show'
  end
end
