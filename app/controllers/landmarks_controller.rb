require 'pry'
class LandmarksController < ApplicationController

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
    #in case other user has already created this landmark:
    if
      @landmark = Landmark.find_by_id(params[:id])
    else
      @landmark = Landmark.create(name: params["landmark"]["name"])
    end
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  post '/landmarks/:id' do
      @landmark = Landmark.find_by_id(params[:id])
      #need stuff below?
      @landmark.name = params["landmark"]["name"]
      @landmark.year_completed = params["landmark"]["year_completed"]
      @landmark.save
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    erb :'landmarks/show'
  end
end
