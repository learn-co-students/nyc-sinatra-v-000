class FiguresController < ApplicationController
  
  get "/figures" do
    @figures = Figure.all
    erb :"/figures/index"
  end 
  
  get "/figures/new" do
    @titles = Title.all 
    @landmarks = Landmark.all 
    erb :"/figures/new"
  end 
  
  post "/figures" do
    
    if !Figure.find_by(name: params[:figure][:name])
      @figure = Figure.create(params[:figure])
      if !Title.all.find_by(name: params[:title][:name]) && !!params[:title][:name]
          @figure.titles.create(params[:title])
      end 
      if !Landmark.find_by(name: params[:landmark][:name]) && !params[:landmark][:name].empty?
          @figure.landmarks.create(params[:landmark])
      end 
      redirect :"/figures/#{@figure.id}"
    else 
      redirect "/figures/new"
    end 
  end 
  
  get "/figures/:id" do 
   @figure = Figure.find(params[:id])
   erb :"/figures/show"
  end 
  
  get "/figures/:id/edit" do 
   @figure = Figure.find(params[:id])
   @landmarks = Landmark.all 
   @titles = Title.all 
   erb :"/figures/edit"
  end 
  
  patch "/figures/:id" do 
    @figure = Figure.find(params[:id])
    #binding.pry
    @figure.update(params[:figure])
    if !Title.all.find_by(name: params[:title][:name]) && !params[:title][:name].empty?
        @figure.titles.create(params[:title])
    end 
    if !Landmark.find_by(name: params[:landmark][:name]) && !params[:landmark][:name].empty?
        @figure.landmarks.create(params[:landmark])
    end 
   
    redirect :"/figures/#{@figure.id}"
  end 
  
  end
