class LandmarksController < ApplicationController

  get '/' do
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end
end
