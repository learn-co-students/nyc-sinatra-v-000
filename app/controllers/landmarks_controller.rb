class LandmarksController < ApplicationController

 get '/landmarks' do
   @landmarks = Landmark.all
   erb :'landmarks/index'
 end

 get '/landmarks/new' do
   erb :'landmarks/new'
 end

 post '/landmarks' do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
   redirect "/landmarks/#{@landmark.id}"
 end

 get '/landmarks/:id' do
   @landmark=Landmark.find_by(id: params[:id])
   erb :'landmarks/show'
 end

 get '/landmarks/:id/edit' do
   @landmark=Landmark.find_by(id: params[:id])
   erb :"landmarks/edit"
 end

 patch '/landmarks' do
   @landmark=Landmark.find_by(id: params[:landmark][:id])
   @landmark.update(params[:landmark])
   redirect "/landmarks/#{@landmark.id}"
 end
end
