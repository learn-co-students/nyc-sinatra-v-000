class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    landmark = Landmark.create(name: params[:landmark[name]])
  end

  patch '/landmarks/:id' do
    @mark = Landmark.find_by_id(params[:id])
    @mark.name = params[:name]
    @mark.year_completed = params[:year_completed]
    @mark.save
    redirect to '/landmarks/#{mark.id}'
  end



end
