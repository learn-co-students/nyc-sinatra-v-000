class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

   get '/figures/new' do
     erb :'figures/new'
   end

   post '/figures' do
     @figure = Figure.create(params[:figure])
     @figure.titles << Title.create(params[:title])
     @figure.landmarks << Landmark.create(params[:landmark])
     @figure.save
   end
end
