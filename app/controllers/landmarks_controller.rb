class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post '/landmarks' do
    "The new landmark has been created!"
  end
end
