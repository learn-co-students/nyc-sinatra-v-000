class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks/new" do
    @landmarks = Figure.all
    erb :'/landmarks/new'
  end

  get "/landmarks/:slug" do
    @landmark = Landmark.find_by_slug(params[:slug])
    @figure = @landmark.figure
    @titles = Title.all
    erb :'/landmarks/show'
  end

  get "/landmarks" do
    
  end

  post "/landmarks" do
  end

  get "/landmarks/:slug/edit" do
  end

  patch "/landmarks/:slug" do
  end
end
