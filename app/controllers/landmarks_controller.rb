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

  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.find_or_create_by(name: params[:landmark_name], year_completed: params[:landmark_year_completed])
    @landmark.save
  end


end
