class LandmarksController < ApplicationController

  get '/landmarks' do #READ: view all of the landmarks
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do #CREATE: open new landmark form
    erb :'landmarks/new'
  end

  post '/landmarks' do #CREATE: create a new landmark
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do #READ: Shows specific landmark
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do #UPDATE: open edit landmark form
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do #UPDATE: Updates instance
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

end
