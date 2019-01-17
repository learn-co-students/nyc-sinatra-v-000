class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all.sort { |a, b| a.name <=> b.name }
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all.sort { |a, b| a.name <=> b.name }
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    @landmark.figure_id = params[:landmark][:figure_id]
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.create(params[:figure])
    end

    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    @figures = Figure.all.sort { |a, b| a.name <=> b.name }
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    @landmark.figure_id = params[:landmark][:figure_id]
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.create(params[:figure])
    end

    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

end
