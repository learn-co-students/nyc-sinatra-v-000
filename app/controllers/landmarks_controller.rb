class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks/new' do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    if params[:landmark][:name] != ""
      @landmark.name = params[:landmark][:name]
    end
    if params[:landmark][:year_completed] != ""
      @landmark.year_completed = params[:landmark][:year_completed]
    end
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
end
