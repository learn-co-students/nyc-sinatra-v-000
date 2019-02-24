class LandmarksController < ApplicationController

  get '/landmarks' do
      @landmarks = Landmark.all
      erb :'landmarks/index'
  end

  get '/landmarks/new' do
      erb :'landmarks/new'
  end

  post '/landmarks' do
      @landmark = Landmark.create(params[:landmark])
      @landmark.figure = Figure.create(params[:figure]) unless params[:figure][:name].empty?
      @landmark.save
      redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
  end

  patch '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      @landmark.update(name: params[:landmark][:name])
      @landmark.update(year_completed: params[:landmark][:year_completed])
      @landmark.figure = Figure.create(params[:figure]) unless params[:figure][:name].empty?

      @landmark.save
      redirect to "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      erb :'/landmarks/edit'
  end


end
