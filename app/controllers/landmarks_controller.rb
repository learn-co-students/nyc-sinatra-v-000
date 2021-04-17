class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmark/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end
end
