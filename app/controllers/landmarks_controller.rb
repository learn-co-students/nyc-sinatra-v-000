class LandmarksController < ApplicationController
  

  get '/landmarks' do
    @all_landmarks = Landmark.all
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    newlandmark = Landmark.find_or_create_by(params[:landmark])
  #  newlandmark.year_completed = params[:landmark][:year_completed]
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/edit'

  end

  patch '/landmarks/:id' do 
    @updatedlandmark = Landmark.find_by(id: params[:id])
    @updatedlandmark.update(params[:landmark])
    @updatedlandmark.year_completed = [:landmark][:year_completed]
    @updatedlandmark.save

    redirect to '/landmarks/#{@landmark.id}'
  end



   




end
