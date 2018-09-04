class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks'  do
    @landmark=Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      @landmark.figure=Figure.create(name: params[:figure][:name])
    end
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmark/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update([:landmark])
    redirect "/landmarks/#{landmark.id}"
  end
end

#  get '/figure/:id/edit' do
#    @landmark = Figure.find_by_id(params[:id])
#    @titles = Title.all
#    @figures = Figure.all
#  erb :'figures/edit'
#  end
