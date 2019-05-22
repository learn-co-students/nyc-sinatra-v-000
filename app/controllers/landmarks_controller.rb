class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    unless params[:title][:name].empty?
      @landmark.title << Title.create(params[:title])
    end
    unless params[:figure][:name].empty?
      @landmark.figure << Figure.create(params[:title])
    end
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get 'landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do

    @landmark = landmark.find(params[:id])

    @landmark.update(params[:landmark])

   if !params[:title][:name].empty?
     @landmark.titles << Title.update(params[:title])
   end
   if !params[:figure][:name].empty?
     @landmark.figures << Figure.update(params[:figure])
   end
    redirect to "/landmarks/#{@landmark.id}"
  end
end
