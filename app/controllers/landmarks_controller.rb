class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end
    
  get '/landmarks/new' do
      erb :"/landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end
  
  post '/landmarks' do
    # binding.pry
    # @landmark = Landmark.create(params['landmark_name'])
    #     if !params[:landmark][:name].empty?
      @landmark.name = Landmark.create(params[:name])
    # end
    if !params[:year_completed].empty?
      @landmark.year_completed = Landmark.create(params[:year_completed])
      # landmark[year_completed]
    end
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
