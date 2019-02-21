class LandmarksController < ApplicationController

  get '/landmarks' do
      @landmarks = Landmark.all
      erb :'landmarks/index'
  end

  get '/landmarks/new' do
      @figures = Figure.all
      erb :'landmarks/new'
  end

  get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    #@landmark.figure << Figure.create(params[:figure]) unless params[:figure][:name].blank?
    #@landmark.save
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmark/:id/edit' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
      @landmarks = Landmark.find_by(params[:id])
      @landmark.update(name: params[:landmark][:name])
      @landmark.update(year_completed: params[:landmark][:year_completed])
      @landmark.figure = Figure.create(params[:figure]) unless params[:name].blank?
      @landmark.save
      redirect to "/landmarks/#{landmark.id}"
  end

end
