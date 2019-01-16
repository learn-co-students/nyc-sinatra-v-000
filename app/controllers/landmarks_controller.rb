class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all.sort { |a, b| a.name <=> b.name }
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all.sort { |a, b| a.name <=> b.name }
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
  end

end
