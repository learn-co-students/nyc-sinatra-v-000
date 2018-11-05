require 'pry'

class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    # raise params.inspect
    # {"landmark_name"=>"My House", "landmark_year_completed"=>"1981", "submit"=>"Create New Landmark"}

    @landmark = Landmark.new
    @landmark.name = params[:landmark_name]
    @landmark.year_completed = params[:landmark_year_completed]
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end


end
