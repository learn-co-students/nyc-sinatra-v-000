class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
      @landmark = Landmark.create(params["landmark"])
      if !params[:figure][:name].empty?
        @landmark.figure = Figure.create(params[:figure][:name])
      end

      @landmark.save
      redirect to "/landmarks/#{@landmark.id}"
    end
end
