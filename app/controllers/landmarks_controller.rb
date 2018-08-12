class LandmarksController < ApplicationController


  get '/landmarks/new' do  #load a new page with loaded data
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end



  post '/landmarks' do #creates a new landmark
  #  binding.pry

    landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])

  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do # load the edit page with one landmark
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
  #  binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect to "/landmarks/#{@landmark.id}"
  end

end
