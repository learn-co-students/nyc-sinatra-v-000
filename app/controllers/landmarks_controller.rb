class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :"landmarks/new"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb :"landmarks/edit"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  post '/landmarks' do
    landmark = Landmark.new(:name => params[:name])
    landmark.figure_id = params[:figure_id]
    landmark.year_completed = params[:year_completed]
    if !params[:figure_name].empty?
      new_figure = Figure.create(:name => params[:figure_name])
      landmark.figure_id = new_figure.id
    end
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end

  patch '/landmarks/:id/edit' do
    #binding.pry
    landmark = Landmark.find(params[:id])
    landmark.name = params[:name]
    landmark.figure_id = params[:figure_id]
    landmark.year_completed = params[:year_completed]
    if !params[:figure_name].empty?
      new_figure = Figure.create(:name => params[:figure_name])
      landmark.figure_id = new_figure.id
    end
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end

end
