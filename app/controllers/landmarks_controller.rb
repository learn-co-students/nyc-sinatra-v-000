class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end
  
  get '/landmarks/new' do
    erb :"landmarks/new"
  end
  
  post '/landmarks' do
    landmark = Landmark.new(params[:landmark])
    landmark.save unless Landmark.all.detect{|l| l.name == landmark.name}
    "The landmark has been built!"
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end
end
