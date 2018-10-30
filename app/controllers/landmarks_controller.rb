class LandmarksController < ApplicationController
  
get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end
  
  
   get '/landmarks/:id' do
      @landmarks = Landmark.find(params[:id])
      erb :'landmarks/show'
   end
   
   get '/landmarks/:id/edit' do
      @landmarks = Landmark.find(params[:id])
      erb :'landmarks/edit'
    end
  
    post '/landmarks' do 
      Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    
      redirect '/landmarks'
    end
    
   patch '/landmarks/:id' do
      @landmarks = Landmark.find(params[:id])
      @landmarks.update(params[:landmark])
      # if !params[:title][:name].empty? 
      #     @landmarks.title << Title.create(params[:name])
      #   else !params[:figure][:name].empty? 
      #   @landmarks.figure << Figure.create(params[:landmark])
      # end
      @landmarks.save
        redirect "landmarks/#{@landmarks.id}"
      end
  
  
end
