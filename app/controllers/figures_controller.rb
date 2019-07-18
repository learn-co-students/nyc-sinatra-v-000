class FiguresController < ApplicationController
  #from Specs
  # visit '/figures'
  # visit '/figures/new'
  # get "/figures/#{@figure.id}"
  # get "/figures/#{@figure.id}/edit"



  get "/figures" do
    erb :"/figures/index"
  end

  get "/figures/new" do
    erb :"/figures/new"
  end

  post "/figures" do
    # binding.pry
    @figure = Figure.create(params[:figure])
    @landmark = Landmark.create(params[:landmark])
    @title = Title.create(params[:title])
    @figure.titles << @title
    @figure.landmarks << @landmark
    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

  patch "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    # @figure.name = params[:figure_name]
    # @figure.landmark = params[:new_landmark]
    # @figure.save
    redirect "/figures/#{@figure.id}"
  end


end
