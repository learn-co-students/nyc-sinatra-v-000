class LandmarksController < ApplicationController
   
   get "/landmarks" do
     @landmarks = Landmark.all
     erb :"/landmarks/index"
   end 
   
   get "/landmarks/new" do 
     erb :"/landmarks/new"
   end 
   
   post "/landmarks" do 
     if !Landmark.find_by(name: params[:landmark][:name]) && !params[:landmark][:name].empty?
        @landmark = Landmark.create(params[:landmark])
        redirect :"/landmarks/#{@landmark.id}"
     else
       redirect :"/landmarks/new"
     end 
   end 
   
   get "/landmarks/:id" do 
     @landmark = Landmark.find(params[:id])
     erb :"/landmarks/show"
   end 
   
   get "/landmarks/:id/edit" do 
     @landmark = Landmark.find(params[:id])
     erb :"/landmarks/edit"
   end 
   
   patch "/landmarks/:id" do 
     @landmark = Landmark.find(params[:id])
     @landmark.update(params[:landmark])
     redirect :"/landmarks/#{@landmark.id}"
   end 
   
end
