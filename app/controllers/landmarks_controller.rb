class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect to ("/landmarks/#{@landmark.id}")
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    if @landmark.name != params[:landmark][:name]
      @landmark.name = params[:landmark][:name]
    end
    if @landmark.year_completed != params[:landmark][:year_completed]
      @landmark.year_completed = params[:landmark][:year_completed]
    end
    @landmark.save
    redirect to ("/landmarks/#{@landmark.id}")
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end
end
