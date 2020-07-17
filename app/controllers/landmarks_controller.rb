class LandmarksController < ApplicationController
  
  get '/landmarks' do
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params["landmark"]["name"])
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.figure_id = params["figure_id"]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.figure_id = params["figure_id"]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
  
end
