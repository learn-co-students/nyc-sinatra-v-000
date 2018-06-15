class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks/new' do
    @landmark = Landmark.create(name: params["landmark_name"])
    #add a param above to cover the year_completed of each landmark
    @landmark.title_ids = params[:landmark][:title_ids]
    @landmark.figure_ids = params[:landmark][:figure_ids]
    @landmark.save
    #still need to figure out how to add NEW titles/landmarks instead of just choosing preexisting ones
    redirect to "landmarks/:slug"
  end

  get '/landmarks/:slug/edit' do
    @landmark = Landmark.find_by_slug(params[:slug])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:slug' do
    @landmark = Landmark.find_by_slug(params[:slug])
    erb :'/landmarks/show'
  end

  patch '/landmarks/:slug' do
    @landmark = Landmark.find_by_slug(params[:slug])
    @landmark.update(params[:landmark])
    @landmark.title_ids = params[:landmark][:title_ids]
    
    @landmark.figure_ids = params[:landmark][:figure_ids]
    @landmark.save
    redirect to "landmarks/:slug"
  end
end
