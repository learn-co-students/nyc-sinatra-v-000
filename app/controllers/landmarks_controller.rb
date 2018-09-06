class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end
  
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
    redirect to '/landmarks'
  end

  get '/landmark/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmark/show'
  end
  
  get '/landmark/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmark/edit'
  end
  
  patch '/landmark/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect to '/landmark/#{@landmark.id}'
  end
  
end
