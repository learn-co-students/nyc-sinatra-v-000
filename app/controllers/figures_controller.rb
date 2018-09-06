class FiguresController < ApplicationController
  # add controller methods
get '/figures' do
    @figures = Figure.all 
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end
  
   get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
   end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to '/figures'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end
  
  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << title
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << landmark
    end
    @figure.save
    redirect to '/figures/#{@figure.id}'
  end
    
  
end
