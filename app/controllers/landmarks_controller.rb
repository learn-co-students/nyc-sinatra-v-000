class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    erb :'/landmark/show'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])


    if !params[:landmark][:name].empty? && !params[:landmark][:year_completed].empty?
      @landmark.name = params[:landmark][:name]
      @landmark.year_completed = params[:landmark][:year_completed]
    end

    @landmark.save

    erb :'/landmarks/show'

  end



end
