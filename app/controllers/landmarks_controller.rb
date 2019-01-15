class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    erb :'/landmarks/index' 
  end
  
  get '/landmarks/new' do 
    
    erb :'/landmarks/new' 
  end
  
  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
      
      if !params["figure"]["name"].empty?
        figure = Figure.create(params[:figure])
      else 
        figure = Figure.find_by_id(params["landmark"]["figure_id"])
      end
    
     @landmark.figure_id = figure.id 
     @landmark.save 
      
    redirect "/landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    
    erb :'/landmarks/show' 
  end
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit' 
  end

  
  patch '/landmarks/:id' do 
  
    # @landmark = Landmark.find(params[:id])
    
    # @landmark.update(params[:landmark])
    
    # if !params["figure"]["name"].empty?
    #     figure = Figure.create(params[:figure])
    #   else 
    #     figure = Figure.find_by_id(params["landmark"]["figure_id"])
    #   end
    
    # @landmark.figure_id = figure.id 
    # @landmark.save 
    
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end
  
end
