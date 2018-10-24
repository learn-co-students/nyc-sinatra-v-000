class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    binding.pry
    @landmark.update(params[:landmark])
    unless params[:figure].empty?
      @landmark.figure = Figure.find_or_create_by(params[:landmark])
    end
    unless params[:title].empty?
      @landmark.figure.titles << Title.create(params[:title])
    end
    @landmark.save

  redirect to "/landmarks/#{@landmark.id}"
  end

end
