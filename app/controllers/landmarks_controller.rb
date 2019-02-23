class LandmarksController < ApplicationController

  get '/landmarks' do
      @landmarks = Landmark.all
      erb :'landmarks/index'
  end

  get '/landmarks/new' do
      erb :'landmarks/new'
  end

  post '/landmarks' do
      @landmark = Landmark.create(params[:landmark])
      redirect "landmarks/#{@landmark.slug}"
  end

  get '/landmarks/:slug' do
      @landmark = Landmark.find_by_slug(params[:slug])
      erb :'landmarks/show'
  end

  patch '/landmarks/:slug' do
      @landmark = Landmark.find_by_slug(params[:slug])
      @landmark.name = params[:landmark][:name]
      @landmark.year_completed = params[:landmark][:year_completed]
      @landmark.save
      redirect to "/landmarks/#{landmark.slug}"
  end

  get '/landmarks/:slug/edit' do
      @landmark = Landmark.find_by_slug(params[:slug])
      erb :'/landmarks/edit'
  end


end
