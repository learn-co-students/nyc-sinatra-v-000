class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    #list all figures
    erb :'figures/index'
  end

  get '/figures/new' do
    #create new figures
    erb :'figures/new'
  end

  post '/figures' do
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
