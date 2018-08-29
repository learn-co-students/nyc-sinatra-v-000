class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/figures/index'
  end

  get '/landmark/new' do
      @titles = Title.all
      @figures = Figure.all
    erb :'/landmarks/new'
  end

end
