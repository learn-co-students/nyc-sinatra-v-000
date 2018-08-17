class LandmarksController < ApplicationController

  get '/' do
    redirect '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    #binding.pry
    @landmark = Landmark.find(params["id"])
    erb :'landmarks/edit'
  end

  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(params["landmark"])
    #@landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params["landmark"])
    #binding.pry
    redirect "/landmarks/#{@landmark.id}"
  end

  delete '/landmarks/:id/delete' do #delete action
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.delete
    erb :'landmarks/deleted'
  end

end
