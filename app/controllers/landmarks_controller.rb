class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmark = Landmark.all
    erb :'landmarks/index' 
  end
  
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end
  
  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    redirect "landmarks/#{@landmark.id}"
  end
end
