class FiguresController < ApplicationController

  get '/figures/new' do
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/new'
  end
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    @figure.title = Title.find_or_create_by(name: params[:title][:name])
    @figure.landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
  end
  
  
end
