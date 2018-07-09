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
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end
  
  
  patch '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    new_name = params[:landmark][:artist]
    new_year = params[:landmark][:year_completed]
    
    if new_name
      @landmark = Landmark.create(:name => year_completed, :year_completed => new_year)
    end
    
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
  
end
