class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    @landmarks = Landmark.all 
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  post '/landmarks/new' do
    @landmark = Landmark.new(params[:name], params[:year])
    @landmark.save
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:name]
    @landmark.year_completed = params[:year_completed]
    @landmark.save
    redirect "/landmarks/#{params[:id]}"
  end

end
