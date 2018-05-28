class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/:slug' do
    @landmark = Landmark.find_by_slug(params[:slug])
    erb :'landmarks/show'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{@landmark.slug}"
  end

  get '/landmarks/:slug/edit' do
    @landmark = Landmark.find_by_slug(params[:slug])
    erb :'landmarks/edit'
  end

  post '/landmarks/:slug' do
    @landmark = Landmark.find_by_slug(params[:slug])
    @landmark.update(params[:landmark])
    redirect to "/landmarks/#{@landmark.slug}"
  end

end
