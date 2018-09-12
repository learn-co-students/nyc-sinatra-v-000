class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/edit' do
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    landmark = Landmark.create(name: params[:landmark[name]])
  end


end
