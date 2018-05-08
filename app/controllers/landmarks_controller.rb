class LandmarksController < ApplicationController

  get '/landmarks' do
      @landmarks = Figure.all
      erb :'landmarks/index'
    end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks' do
    puts params

    @landmark = Landmark.create(params["landmark"])
    redirect to
  end

  patch '/landmarks/:id' do
    binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name])
    @landmark.update(year_completed: params[:landmark][:year_completed])

    @landmark.save

    redirect to "landmarks/#{@landmark.id}"
  end

end
