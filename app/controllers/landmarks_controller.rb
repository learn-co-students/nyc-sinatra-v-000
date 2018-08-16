class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :"landmarks/new"
  end

  get '/landmarks/:slug' do
    @landmark = Landmark.find_by(id: params[:slug])
    erb :"landmarks/show"
  end

  get '/landmarks/:slug/edit' do
    @landmark = Landmark.find_by(id: params[:slug])
    @figures = Figure.all
    erb :"landmarks/edit"
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    if params[:figure][:name].length > 0
      figure = Figure.find_or_create_by(name: params[:figure][:name])
      landmark.figure = figure
      landmark.save
    else
      figure = Figure.find(params[:figure][:id])
      landmark.figure = figure
      landmark.save
    end
    redirect "/landmarks"
  end

  patch '/landmarks/:slug' do
    landmark = Landmark.find_by(id: params[:slug])
    landmark.update(params[:landmark]) 
    if params[:figure][:name].length > 0
      figure = Figure.find_or_create_by(name: params[:figure][:name])
      landmark.figure = figure
    elsif !params[:figure][:id].nil?
      figure = Figure.find_by(id: params[:figure][:id])
      landmark.figure = figure
    end
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end

end
