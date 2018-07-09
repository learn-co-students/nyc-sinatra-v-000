class LandmarksController < ApplicationController
  
  
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end
  
  post '/landmarks' do 
    # raise params.inspect
    landmark = Landmark.create(:name => params[:name], :year_completed => params[:year_completed])
    redirect to "landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end
  
  
  
  
  
  

end
