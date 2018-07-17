class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'landmarks/show'
  end

  post '/landmarks' do
    @new_landmark = Landmark.create(params[:landmark])

    unless params[:figure][:name].empty?
      @new_landmark.figure << Landmark.new(:name => params[:figure][:name])
    end

    @new_landmark.save

    redirect to "/figures/#{@new_landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])

    @landmark.update(params[:landmark])

    unless params[:figure][:name].empty?
      @landmark.figure = Landmark.new(:name => params[:figure][:name])
    end

    @landmark.save

    redirect to "/landmark/#{landmark.id}"
  end
end
