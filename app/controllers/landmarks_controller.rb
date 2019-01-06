class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.save

    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])

    erb :'landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])

    erb :'landmarks/show'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save

    redirect "landmarks/#{@landmark.id}"
  end
end
