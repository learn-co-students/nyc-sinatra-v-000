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
    #should be able to select ONE historical figure, drawing from EITHER the radio boxes OR the "New Figure Name" textbox
#not sure if I should even include Titles... i feel like those should be automatically linked through the Figures...
#if I make it optional to add titles through the New landmark page, would that overwrite the existing Figures?
    #should be able to select MULTIPLE titles, drawing from the checkboxes AND the "New Title Name" textboxe
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
