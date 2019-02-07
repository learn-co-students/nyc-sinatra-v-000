require 'pry'
class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    if !Landmark.find {|landmark| landmark.name == params[:landmark][:name]}
      @landmark = Landmark.create(params[:landmark])
    else
      # landmark already exists
    end

    if Figure.find {|figure| figure.name == params["Figure Name"]}
      @landmark.figure = Figure.find {|figure| figure.name == params["Figure Name"]}
    else
      @landmark.figure = Figure.create(name: params["Figure Name"])
    end

    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
#    binding.pry
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
#    binding.pry
    @landmark.figure.name = params["Figure Name"]
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end
end
