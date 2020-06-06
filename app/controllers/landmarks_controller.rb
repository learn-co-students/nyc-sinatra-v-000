class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    
    erb :"/landmarks/index"
  end
  
  
  get '/landmarks/new' do
  
    erb :"/landmarks/new"
  end
  

  # post '/landmarks' do
  #   # binding.pry
  #   @figure = Figure.create(params['figure'])
  #       if !params[:landmark][:name].empty?
  #     @figure.landmarks << Landmark.create(params[:landmark])
  #   end
  #   if !params[:title][:name].empty?
  #     @figure.titles << Title.create(params[:title])
  #   end
  #   @figure.save
  #   redirect to "/landmarks/#{@figure.id}"
  # end
end
