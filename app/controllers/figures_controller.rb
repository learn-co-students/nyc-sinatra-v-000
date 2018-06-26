class FiguresController < ApplicationController

  get '/figures/new' do
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/new'
  end
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    binding.pry
    @figure.titles = Title.find_or_create_by(name: params[:title][:name])
    @figure.landmarks = Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.save
  end
  
  
end
