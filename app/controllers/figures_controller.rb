class FiguresController < ApplicationController

  get '/figures/new' do
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/new'
  end
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.save
  end
  
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/:id' do 
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end
  
  get '/figures/:id/edit' do 
    @figure = Figure.find_by(id: params[:id])
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/edit'
  end
  
  patch '/figures/:id' do 
    @figure = Figure.find_by(id: params[:id])
    @figure.titles << Title.find_or_create_by(name: params[:title_ids])
    @figure.landmarks << Landmark.find_or_create_by(id: params[:landmark_ids])
    @figure.save
    redirect to '/figures/:id'
  end
  
  
end
