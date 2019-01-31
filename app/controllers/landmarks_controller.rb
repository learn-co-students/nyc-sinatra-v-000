class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks' do
    #list all landmarks
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    #create a new landmark
    erb :'landmarks/new'
  end

  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])

    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    #view single landmark
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
    #edit single landmark
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])

    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end
end
