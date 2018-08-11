class LandmarksController < ApplicationController

  get '/landmarks/new' do  #load a new page with loaded data
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do

      if params[:landmark][:name] != ""
          landmarks << Landmark.create(name: params[:landmark][:name])
    end
  end


end
