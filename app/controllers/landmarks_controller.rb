class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks/new" do #landmark doesn't need a title - Isaac Villcana
    @landmarks = Landmark.all
    @landmark = Landmark.first
    erb :'/landmarks/new'
  end

  get "/landmarks/:slug" do
    #@landmark = Landmark.find_by_slug(params["slug"])
    @landmark = Landmark.find_by_id(params["slug"]) #params("slug") was an id.
    @figure = @landmark.figure
    erb :'/landmarks/show'
  end

  get "/landmarks" do
    #remember the route isn't     its this ^, also don't forget the seeds
    @landmarks = Landmark.all
    erb :'/landmarks/index' #this
  end

  post "/landmarks" do
    @landmark = Landmark.create(params[:landmark])
    binding.pry
    if !params["figure"]["name"].empty? && !Figure.find_by(name: params["figure"]["name"])
      @figure = Figure.create(name: params["figure"]["name"])
      @landmark.figure = @figure
      @landmark.save
    end
  end

  get "/landmarks/:slug/edit" do
    @landmark = Landmark.find_by(id: params["slug"])
    @figure = @landmark.figure
    @titles = Title.all
    erb :"/landmarks/edit"
  end


  patch "/landmarks/:slug" do
    redirect to("/landsmarks/#{@landmark.slug}")
  end
end
