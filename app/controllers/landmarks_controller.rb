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
    redirect to("/landmarks/#{@landmark.id}") #always remember the redirect
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by(id: params["id"])
    erb :"/landmarks/edit"
  end


  patch "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params["id"])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to("/landmarks/#{@landmark.id}")
  end
end
