class LandmarksController < ApplicationController

    post '/landmarks/new' do
      @landmark = Landmark.create(params[:id])
      erb :'landmarks/new'
    end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmark/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update([:landmark])
    redirect "/landmarks/#{landmark.id}"
  end

#  get '/figure/:id/edit' do
#    @landmark = Figure.find_by_id(params[:id])
#    @titles = Title.all
#    @figures = Figure.all
#  erb :'figures/edit'
#  end

end
