class LandmarksController < ApplicationController

  get '/' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
end
