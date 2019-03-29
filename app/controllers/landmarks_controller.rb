class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks" do
    #remember the route isn't     its this ^, also don't forget the seeds
    @landmarks = Landmark.all
    erb :'/landmarks/index' #this
  end

  get "/landmarks/new" do #landmark doesn't need a title - Isaac Villcana
    @landmarks = Landmark.all
    @landmark = Landmark.first
    erb :'/landmarks/new'
  end

  get "/landmarks/:id" do #slug isn't needed because it isn't in the spec and the routes are numbers
    #@landmark = Landmark.find_by_slug(params["slug"])
    @landmark = Landmark.find_by_id(params["id"]) #params("slug") was an id.
    #@figure = @landmark.figure
    erb :'/landmarks/show'
  end

  post "/landmarks" do
    @landmark = Landmark.create(params[:landmark])
    #if !params["figure"]["name"].empty? && !Figure.find_by(name: params["figure"]["name"])
    #  @figure = Figure.create(name: params["figure"]["name"])
    #  @landmark.figure = @figure
    #  @landmark.save
    #else params["figure"]["name"].empty?
    #  @figure = Figure.find_by_id(params["landmark"]["figure_id"])
    #  @landmark.figure_id = params["landmark"]["figure_id"]
    #  @landmark.figure = @figure
    #  @landmark.save
    #end
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by(id: params["id"])
    erb :"/landmarks/edit"
  end


  patch "/landmarks/:id" do
    redirect to("/landsmarks/#{@landmark.id}")
  end
end
