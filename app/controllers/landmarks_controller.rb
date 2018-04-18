class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(:name =>params["landmark_name"],:year_completed => params["landmark_year_completed"])
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark = Landmark.update(:name =>params["name"],:year_completed => params["year_completed"])
    redirect to "/landmarks/#{@landmark.id}"
  end
end
