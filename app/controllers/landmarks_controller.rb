class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    erb :'/landmarks/index' 
  end
  
  get '/landmarks/new' do 
    
    erb :'/landmarks/new' 
  end
  
  post '/landmarks' do 
    
    redirect "/landmarks/#{@landmark.name}"
  end
  
  get '/landmarks/:name' do 
    
    erb :'/landmarks/show' 
  end
  
  get '/landmarks/:name/edit' do 
    
    erb :'/landmarks/edit' 
  end
  
end
