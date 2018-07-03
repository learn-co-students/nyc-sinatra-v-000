class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post '/landmarks/new' do
    Landmark.create(name: params[:landmark_name], year_completed: params[:landmark_year_completed])
    redirect "/landmarks"
  end

  get '/landmarks' do
    erb :"landmarks/index"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:name], year_completed: params[:year_completed])

    redirect "/landmarks/#{@landmark.id}"
  end
end
