class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
    end

    get '/landmarks/:id' do
      @landmark = Landmark.find_by_id(params[:id])
      erb :'landmarks/show'
    end

    post '/landmarks' do
      @landmark = Landmark.create(name: params["name"], year_completed: params["year_completed"])

      redirect to "/landmarks/#{@landmark.id}"
    end

    get '/landmarks/:id/edit' do
      @landmark = Landmark.find_by_id(params[:id])
      erb :'landmarks/edit'
    end

    patch '/landmarks/:id' do
      @landmark = Landmark.find_by_id(params[:id])
      @landmark.year_completed = params[:year_completed]
      @landmark.name = params[:name]
      @landmark.save

      redirect "landmarks/#{@landmark.id}"
    end

  end
