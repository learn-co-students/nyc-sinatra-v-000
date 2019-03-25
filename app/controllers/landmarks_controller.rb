class LandmarksController < ApplicationController
  
  get '/new' do
    erb :'views/landmarks/new'
  end

end
