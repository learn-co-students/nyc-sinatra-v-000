class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    @titles = Title.all
    erb :'landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.new(params[:landmark])
    if params[:figure] && !params[:figure][:name].strip.empty?
      landmark.figure == Title.find_or_create_by(params[:figure])
    end
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id]) || (return 404)
    erb :'landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id]) || (return 404)
    @figures = Figure.all
    @titles = Title.all
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find_by(id: params[:id]) || (return 404)
    landmark.update(params[:landmark])    
    if params[:figure] && !params[:figure][:name].strip.empty?
      landmark.figure == Figure.create(params[:figure])
    end
    landmark.save
    redirect "/landmarks/#{params[:id]}"
  end
end
