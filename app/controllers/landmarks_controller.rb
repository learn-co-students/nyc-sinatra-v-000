class LandmarksController < ApplicationController

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
  end

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/:landmark_id' do
    @landmark = Landmark.all.find_by(id: params[:landmark_id])

    erb :'landmarks/show'
  end

  get '/landmarks/:landmark_id/edit' do
    @landmark = Landmark.all.find_by(id: params[:landmark_id])

    erb :'landmarks/edit'
  end

  patch '/landmarks/:landmark_id' do
    @landmark = Landmark.all.find_by(id: params[:landmark_id])
    @landmark.update(name: params[:name], year_completed: params[:year_completed])
    @landmark.save

    redirect("/landmarks/#{@landmark.id}")
  end





end
