class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
    erb :'/landmarks/show'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end
end
