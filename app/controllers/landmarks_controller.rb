class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'landmarks/index'
  end

  post '/landmarks/new' do
    erb :'landmarks/new'

  end




end
