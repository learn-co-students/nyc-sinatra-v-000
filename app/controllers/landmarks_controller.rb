require "pry"
class LandmarksController < ApplicationController
    
  get '/landmarks/new' do
     @titles = Title.all
     @landmarks = Landmark.all
    erb :'landmarks/new'
  end
  
  post '/landmarks' do
     @landmarks = Landmark.create(params[:landmark])
     @landmarks.save

    redirect "landmarks/#{@landmark.id}"
   end
   
   get "/landmarks" do 
     @landmarks = Landmark.all
    erb :'landmarks/index'
   end
   
   get "/landmarks/:id" do 
      @landmarks = Landmark.find(params[:id])
    erb :'/landmarks/show'
   end
   
  get '/landmarks/:id/edit' do
    @landmarks = Landmark.find_by(params[:id])

    erb :'landmarks/edit'
  end
  
  patch '/landmarks/:id' do
    @landmarks = Landmark.find_by(params[:id])
    @landmarks.update(params[:landmark])
    @landmarks.save

    redirect "landmarks/#{@landmark.id}"
  end
end
