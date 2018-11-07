class LandmarksController < ApplicationController

  get '/landmarks/new' do

    erb :"landmarks/new"
  end

  post '/landmarks' do
    # binding.pry
    @landmark = Landmark.create(params["landmark"])
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params["id"])
    erb :"landmarks/edit"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params["id"])
    erb :"landmarks/show"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params["id"])
    @landmark.update(params["landmark"])

    redirect "/landmarks/#{@landmark.id}"
  end
end
