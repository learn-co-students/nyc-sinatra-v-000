class LandmarksController < ApplicationController
    
  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    if !params["title"]["name"].empty?
      @landmark.titles << Title.create(params[:title])
    end

    if !params["figure"]["name"].empty?
      @landmark.figure << Figure.create(params[:figure])
    end

    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    redirect to :"/landmarks/#{@landmark.id}"
  end

end
