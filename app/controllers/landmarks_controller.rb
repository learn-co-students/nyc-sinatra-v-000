class LandmarksController < ApplicationController

  get '/landmarks' do #Index request
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do #create request
    erb :"landmarks/new"
  end

  post '/landmarks' do #create and redirect
    @landmark = Landmark.create(params[:landmark])

    redirect :"landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do #show request
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do #edit request
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do #edit and redirect
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    redirect :"landmarks/#{@landmark.id}"
  end

end
