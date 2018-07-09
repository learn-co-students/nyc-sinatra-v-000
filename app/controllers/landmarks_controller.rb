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
    # new_artist = params[:song][:artist]
    # new_genre = Genre.find(params[:song][:genres])
    
    # if @song.artist.name != new_artist
    #   @song.artist = Artist.create(:name => new_artist)
    # end
    
    # if new_genre
    #   @song.genres = []
    #   @song.genres << new_genre
    # end
    
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
  
  
  

end
