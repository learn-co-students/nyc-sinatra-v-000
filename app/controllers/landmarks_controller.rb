class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    new_landmark = Landmark.new(name: params['landmark']['name'], year_completed: params['landmark']['year_copmleted'])

    new_landmark.save

    redirect to "landmark/#{new_figure.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end



  patch '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end





end
