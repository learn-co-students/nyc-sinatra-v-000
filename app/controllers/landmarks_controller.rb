class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmarks.new
    erb :"landmark/index"
  end
end
