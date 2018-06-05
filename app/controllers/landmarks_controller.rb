class LandmarksController < ApplicationController

   get '/landmarks' do
     @landmarks = Landmark.all
      erb :'/landmarks/index'
   end

   get  '/landmarks/new' do
      @landmarks = Landmark.all
      erb :'/landmarks/new'
    end

    get '/landmarks/:id' do
        @landmark = Landmark.find_by_id(params[:id])
        # model name followed by a method
        erb :'/landmarks/show'
     end


     get '/landmarks/:id/edit' do
        @landmark = Landmark.find(params[:id])
      #  slug helps to find by name instaed of ID
        erb :'/landmarks/edit'
    end


end
