class LandmarksController < ApplicationController
  
  
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end
  
  post '/landmarks' do 
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
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end
  
  
  patch '/landmarks/:id' do 
    # raise params.inspect
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
  
end
