require 'pry'
class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    binding.pry
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

end
