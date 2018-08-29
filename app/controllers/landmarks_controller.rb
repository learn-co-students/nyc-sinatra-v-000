class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    @figure.landmarks << Landmark.find_or_create_by(params["landmark"])if params["landmark"]["name"].length >0
    @landmark.save
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get "/landmarks/:id/edit" do
    if params[:id]
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
    end
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end

end
