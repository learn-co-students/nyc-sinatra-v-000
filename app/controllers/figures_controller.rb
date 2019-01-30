class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    #list all figures
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    
  end

  get '/figures/:id' do
    #see a single figure
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    #edit a single figure
    erb :'figures/edit'
  end

  patch '/figures/:id' do

  end



end
