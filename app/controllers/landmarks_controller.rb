class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end
  
  get '/landmarks/new' do
    erb :'landmarks/new'
  end
   
  get '/landmark/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end
  
  get '/landmark/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end
  
  
  post '/landmarks' do
    Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect '/landmarks'
  end
  
  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
  
 
end
