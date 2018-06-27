class FiguresController < ApplicationController

  get '/figures/new' do
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/new'
  end
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    unless params[:title][:name].empty?
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end
    unless params[:landmark][:name].empty?
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end
  
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
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
    @figure.update(params[:figure])
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.save
    redirect to "figures/#{@figure.id}"
  end
  
  
end
