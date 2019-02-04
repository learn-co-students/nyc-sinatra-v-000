class LandmarksController < ApplicationController
   get '/landmarks' do
    erb :"landmarks/index"
  end
  
  get '/landmarks/new' do
    erb :"landmarks/new" 
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show" 
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end
  
   post '/landmarks' do
     
    @landmark = Landmark.create(:name => params[:landmark][:name])
    @landmark.year_completed = params[:landmark][:year_completed]
    
    @landmark.save

    flash[:message] = "Successfully created landmark."

    redirect("/landmarks/#{@landmark.id}")
  end
  
  patch '/landmarks/:id' do
    
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    
    @landmark.save

    flash[:message] = "Successfully updated landmark."
    
    redirect("/landmarks/#{@landmark.id}")
  end
  
end
