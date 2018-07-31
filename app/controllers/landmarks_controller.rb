class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @figure = @landmark.figures.first.name

    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    #figure?
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

end
