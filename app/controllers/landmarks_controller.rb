class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :"/application/landmarks/new"
  end

end
