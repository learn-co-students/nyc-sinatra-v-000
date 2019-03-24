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
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post "/landmarks" do
    binding.pry
    @landmark = figure.create(name: params["landmark_name"], year_completed: params["landmark_year_completed"])
    if !params["figure"]["name"].empty? && !Figure.find_by(name: params[:figure][:name])
      @figure = Figure.find_by(name: params["figure"]["name"])
    elsif Landmark.find_by(name: params["figure"]["name"])
      
    end
  end

  get "/landmarks/:slug/edit" do
  end

  patch "/landmarks/:slug" do
  end
end
