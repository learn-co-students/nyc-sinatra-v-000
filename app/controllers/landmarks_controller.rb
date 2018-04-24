class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:slug' do
    @landmark=Landmark.find_by_slug(params[:slug])
    erb :'landmarks/show'
  end

end
