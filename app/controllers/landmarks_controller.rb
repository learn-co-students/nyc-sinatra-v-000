class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    lm = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      lm.figure = Figure.create(params[:figure])
    end
    #if !params[:landmark][:name].empty?  && !params[:landmark][:year_completed].empty?
    #  figure.landmarks << Landmark.create(params[:landmark])
    #end
    lm.save

    redirect "landmarks/#{lm.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    
    lm = Landmark.find(params[:id])
    lm.update(params[:landmark])
    if !params[:figure][:name].empty?
      lm.figure = Figure.create(params[:figure])
    end
    lm.save

    redirect "landmarks/#{lm.id}"
  end

end
