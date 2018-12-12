class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end


  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params["landmark"]["name"])
    if params["landmark"]["year_completed"] != nil
      @landmark.year_completed = params["landmark"]["year_completed"]
    end
    erb :'/landmarks/index'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(name: params["landmark"]["name"])
    @landmark.update(year_completed: params["landmark"]["year_completed"])
    erb :'/landmarks/show'
  end

end
