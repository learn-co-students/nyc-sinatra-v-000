class LandmarksController < ApplicationController

  # create related
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    erb :'landmarks/show'
  end

  # retrieve
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  # update related
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect :"/landmarks/#{@landmark.id}"
  end
end
