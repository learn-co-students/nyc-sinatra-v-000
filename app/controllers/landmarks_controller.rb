class LandmarksController < ApplicationController

  get '/figures/new' do
    erb :'/landmarks/new'
  end

  post '/figures' do

  end

  get 'figures/:id' do
    
  end
end
