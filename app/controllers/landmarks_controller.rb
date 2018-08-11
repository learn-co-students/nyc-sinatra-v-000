class LandmarksController < ApplicationController

  get '/landmarks' do

    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do  #load a new page with loaded data
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do #creates a new landmark
  #  binding.pry
      if params[:landmark][:name] != ""
          landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    end
  end

  get '/landmarks/show' do
    binding.pry
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end
end
