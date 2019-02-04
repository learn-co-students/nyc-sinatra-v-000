require 'rack-flash'

class FiguresController < ApplicationController
  use Rack::Flash
  
  # add controller methods
  get '/figures' do
    erb :"figures/index"
  end
  
  get '/figures/new' do
    erb :"figures/new"
  end
  
  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    
    if params[:figure][:title_ids] != nil
      @figure.title_ids = params[:figure][:title_ids]
    else
    @title = Title.find_or_create_by(:name => params[:title][:name])
    @figure.titles << @title
    end
    
    if params[:landmark][:name].empty?
    @figure.landmark_ids = params[:figure][:landmark_ids]
    else
    @landmark = Landmark.find_or_create_by(:name => params[:landmark][:name])
    end
    
    if !params[:landmark][:year].empty?
    @landmark.year_completed = params[:landmark][:year].to_i
    end
    
    if @landmark != nil
    @figure.landmarks << @landmark
    end
    
    @figure.save

    flash[:message] = "Successfully created figure."

    redirect("/figures/#{@figure.id}")
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end
  
  patch '/figures/:id' do
    
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    
    if params[:figure][:title_ids] != nil
      @figure.title_ids = params[:figure][:title_ids]
    else
      @title = Title.find_or_create_by(:name => params[:title][:name])
      @figure.titles << @title
    end
    
    if params[:landmark][:name].empty?
    @figure.landmark_ids = params[:figure][:landmark_ids]
    else
    @landmark = Landmark.find_or_create_by(:name => params[:landmark][:name])
    end
    
    if !params[:landmark][:year].empty?
    @landmark.year_completed = params[:landmark][:year].to_i
    end
    
    if @landmark != nil
    @figure.landmarks << @landmark
    end
    
    @figure.save

    flash[:message] = "Successfully updated figure."
    
    redirect("/figures/#{@figure.id}")
  end
  
end
