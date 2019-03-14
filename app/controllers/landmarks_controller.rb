class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @land = Landmark.find_or_create_by(params[:landmark])
    erb :"/landmarks/#{@land.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @land = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @land = Landmark.find(params[:id])
    @land.update(:name => params[:landmark][:name], :year_completed => params[:landmark][:year_completed])
    erb :"/landmarks/#{@land.id}"
  end
  
end
