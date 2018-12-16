class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(id: params[:id])

    if params[:landmark][:name] && !params[:landmark][:name].empty?
      @landmark.name = params[:landmark][:name]
    end

    if params[:landmark][:year_completed] && !params[:landmark][:year_completed].empty?
      @landmark.name = params[:landmark][:name]
    end

    @landmark.save

    erb :'/landmarks/show'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do

    @landmark = Landmark.find_by(id: params[:id])

    if params[:landmark][:name] && !params[:landmark][:name].empty?
      @landmark.name = params[:landmark][:name]
    end

    if params[:landmark][:year_completed] && !params[:landmark][:year_completed].empty?
      @landmark.year_completed = params[:landmark][:year_completed]
    end

    @landmark.save
    redirect "/landmarks/#{@landmark.id}"

  end


end
