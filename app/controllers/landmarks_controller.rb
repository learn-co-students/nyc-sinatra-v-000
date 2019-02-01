class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmark/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmark/show'
  end

  get '/landmark/new' do
    @figures = Figure.all
    @titles = Title.all
    erb :'/landmark/new'
  end

  post '/landmark' do
    @landmark = Landmark.create(params)
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmark/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmark/edit'
  end

  patch '/landmark/:id' do
    
  end

end
