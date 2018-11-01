class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
    end

    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
    end
    
    post '/landmarks' do
      @landmark = Landmark.create(params["landmark"])
      @landmark.save

      redirect to "/figures/#{@landmark.id}"
    end

end
