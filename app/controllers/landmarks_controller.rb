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
    Landmark.create(name:params["landmark"]["name"],year_completed:params["landmark"]["year_completed"])
    redirect '/landmarks'
    end
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
