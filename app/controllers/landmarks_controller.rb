class LandmarksController < ApplicationController
  get '/landmarks' do
    #binding.pry
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end


  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    #binding.pry
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    #binding.pry
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.find_or_create_by(name: params[:landmark_name], year_completed: params[:landmark_year_completed])
    @landmark.save
  end

  post '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(name: params[:name], year_completed: params[:year_completed])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end


end
