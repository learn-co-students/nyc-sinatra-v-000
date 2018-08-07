require 'pry'
class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/application/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/application/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/application/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/application/landmarks/edit'
  end

  patch '/landmarks/:id/edit' do
    @original_landmark = Landmark.find_by_id(params[:id])
    @original_landmark.update(params[:landmark])
    @original_landmark.save

    redirect "/landmarks/#{@original_landmark.id}"
  end
end
