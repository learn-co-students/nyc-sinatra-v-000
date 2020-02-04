class FiguresController < ApplicationController
  
  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post "/figures" do
    @figure = Figure.create(name: params[:figure][:name])
    
    if !params[:figure][:title_ids].nil?
      params[:figure][:title_ids].each do |t|
        @figure.titles << Title.find_by(:id[t])
      end
    end

    if !params[:title][:name].strip.empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:figure][:landmark_ids].nil?
      params[:figure][:landmark_ids].each do |l|
        @figure.landmarks << Landmark.find_by(:id[l])
      end
    end

    if !params[:landmark][:name].strip.empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end

  end

  get '/figures/:id' do 
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do 
    @figure = Figure.find_by(params[:id])
    @figure.name = params[:figure][:name]
    
    erb :'/figures/show'
  end







end
