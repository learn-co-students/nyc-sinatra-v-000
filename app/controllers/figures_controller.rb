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
    @figure = Figure.create(params[:figure]) #no if else needed because there is no checklist for figure.
    #New and Edit work on a singular figure.

    if !params[:landmark].empty? && !Landmark.find_by(name: params["landmark"]["name"]) || !Landmark.find_by(year_completed: params["landmark"]["year_completed"])
      @landmark = Landmark.create(params[:landmark])
      @landmark.figure = @figure
      @landmark.save
    #else params[:landmark].empty?
    #  params["figure"]["landmark_ids"].each do |id|
    #  landmark_figures = []
    #  @landmark = Landmark.find_by()
    #  @landmark.save
    end

    #if !params[:title].empty? && !Title.find_by(name: params["title"]["name"])

    #  @title = Title.create(params[:title])
    #  @title.save
    if !(params[:title][:name].empty?) #parenthesis help alot
      binding.pry
      @title = Title.create(params[:title])
      @figure.titles << @title #many to many, more than one title
      @figure.save
    else
    end
    #extra else stuff not needed for title

    redirect to("/figures/#{@figure.id}")
  end

  get "/figures/:id/edit" do
    erb :"/figures/edit"
  end

  patch "/figures/:id" do
    redirect to("/figures/#{@figure.id}")
  end
end
