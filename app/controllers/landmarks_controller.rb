class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all|
    @figures = Figure.application_controller
    erb :'landmarks/index'
  end


  get '/landmarks/new' do
    erb :'landmarks/new'
  end



  post '/landmarks' do
    redirect
  end



  get '/landmarks/:id' do
    erb :
  end


  get '/landmarks/:id/edit'do
    erb :
  end



  patch '/landmarks/:id'do
    erb :
  end


  put '/landmarks/id' do
    erb :
  end


  delete '/landmarks/:id' do
    erb :
  end


end
