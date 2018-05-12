class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end
  
  post '/landmarks' do
    new_landmark_id = Landmark.create(params[:landmark]).id
    redirect to "/landmarks/#{new_landmark_id}"
  end
  
  patch '/landmarks/:id' do
    Landmark.find(params[:id]).update(params[:landmark])
    redirect to "/landmarks/#{params[:id]}"
  end
  
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end
    
end
