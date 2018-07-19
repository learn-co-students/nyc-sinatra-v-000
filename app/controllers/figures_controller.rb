class FiguresController < ApplicationController

  get "/figures/new" do
    erb :"/figures/new"
  end

  get "/figures/:id" do
    @figure =Figure.find_by(id: params[:id])
    erb :"figures/single"
  end

  post "/figures" do
    new_figure = Figure.create(params[:figure])
    new_figure.titles << Title.find_or_create_by(params[:title])
    new_figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    redirect "/figures"
  end

  get "/figures" do
    @figures = Figure.all
    erb :"/figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by(id: params[:id])
    erb :"/figures/"
  end




end
