class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    unless params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end

    unless params[:figure][:name].empty?
      @landmark.figure << Figure.create(params[:figure])
    end

    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = landmark.find_by_id(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = landmark.find_by_id(params[:id])

    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    unless params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end

    unless params[:landmark][:name].empty?
      @landmark.landmarks << Landmark.create(params[:landmark])
    end
    
    @landmark.save

    redirect to :"/landmarks/#{@landmark.id}"
  end
end
