class LandmarksController < ApplicationController
  get "/landmarks" do
    erb :"/landmarks/index"
  end

  get "/landmarks/new" do
    erb :"/landmarks/new"
  end

  post "/landmarks/new" do
    @landmark = Landmark.find_or_create_by(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end


end
