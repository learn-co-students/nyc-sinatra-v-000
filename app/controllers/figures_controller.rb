class FiguresController < ApplicationController
  # add controller methods
  get "/figures" do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/new" do
    erb :'/figures/new'
  end

  get "/figures/:id" do
    erb :'/figures/show'
  end

  post "/figures" do
    if !params[:title].empty? && !Title.find_by(name: params["title"]["name"]) || !Landmark.find_by(year_completed: params["landmark"]["year_completed"])
      @title = Title.create(params[:title])
      @landmark.save
    #else params[:title].empty?
    #  @landmark = Title.find_by_id(params["Title"]["figure_id"])
    #  @landmark.save
    end

    if !params[:landmark].empty? && !Landmark.find_by(name: params["landmark"]["name"]) || !Landmark.find_by(year_completed: params["landmark"]["year_completed"])
      @landmark = Landmark.create(params[:landmark])
      @landmark.save
    #else params[:landmark].empty?
    #  params["figure"]["landmark_ids"].each do |id|
    #  landmark_figures = []
    #  @landmark = Landmark.find_by()
    #  @landmark.save
    end

    if !params["figure"]["name"].empty? && !Figure.find_by(name: params["figure"]["name"])
      @figure = Figure.create(name: params["figure"]["name"])
      @landmark.figure = @figure
      @landmark.save
    else params["figure"]["name"].empty?
      @figure = Figure.find_by_id(params["landmark"]["figure_id"])
      @landmark.figure_id = params["landmark"]["figure_id"]
      @landmark.figure = @figure
      @landmark.save
    end
    redirect to("/figures/#{@figure.id}")
  end

  get "/figures/:id/edit" do
    erb :"/figures/edit"
  end

  patch "/figures/:id" do
    redirect to("/figures/#{@figure.id}")
  end
end
