class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks/new" do
    @landmarks = Landmark.all
    @landmark = Landmark.first
    erb :'/landmarks/new'
  end

  get "/landmarks/:slug" do
    @landmark = Landmark.find_by(id: params["slug"])
    @figure = @landmark.figure
    @titles = Title.all
    erb :'/landmarks/show'
  end

  get "/landmarks" do
    #remember the route isn't     its this ^, also don't forget the seeds
    @landmarks = Landmark.all
    erb :'/landmarks/index' #this
  end

  post "/landmarks" do
    @landmark = Landmark.create(name: params["landmark_name"], year_completed: params["landmark_year_completed"])
    if !params["title"]["name"].empty? && !Title.find_by(name: params["title"]["name"])
      @title = Title.create(name: params["title"]["name"])
      @landmark.titles << @title = Title.create(name: params["title"]["name"])
      @landmark.save
    elsif Title.find_by(name: params["title"]["name"])
      @title = Title.find_by(name: params["title"]["name"])
      @landmark.titles << @title = Title.create(name: params["title"]["name"])
      @landmark.save
    end

    if !params["figure"]["name"].empty?
      @figure = Figure.create(name: params["figure"]["name"])
      @landmark.figure = @figure
      @landmark.save
    end
  end

  get "/landmarks/:slug/edit" do
  end

  patch "/landmarks/:slug" do
  end
end
