class LandmarksController < ApplicationController

  # from Specs
  # visit '/landmarks'
  # visit '/landmarks/new'
  # get "/landmarks/#{@landmark.id}"
  # get "/landmarks/#{@landmark.id}/edit"
  # visit "/landmarks/#{@original_landmark.id}/edit"

  get "/landmarks" do
    erb :"/landmarks/index"
  end

  get "/landmarks/new" do
    erb :"/landmarks/new"
  end

  post "/landmarks" do
    @landmark = Landmark.create(params[:landmark])
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    redirect "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end


end
