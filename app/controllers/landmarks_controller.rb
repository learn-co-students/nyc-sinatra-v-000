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
    if !!params[:landmark][:figure_ids]
      @landmark.figure = Figure.find(params[:figure_id])
    elsif params[:figure][:name] != ""
      @landmark.figure.create(params[:figure])
    end

    redirect "/landmarks/#{@landmark.id}" 
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update({name: params[:landmark][:name], year_completed: params[:landmark][:year_completed]})

    if !!params[:landmark][:figure_ids]
      @landmark.figure = Figure.find(params[:figure_id])
    elsif params[:figure][:name] != ""
      @landmark.figure.create(params[:figure])
    end

    @landmark.save

    redirect "/landmarks/#{@figure.id}"
  end
end
