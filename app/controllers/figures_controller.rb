class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    erb :'/figures/edit'
  end

  post '/figures' do
    #new figure
    @figure= Figure.create(name: params[:figure][:name])
    #assign existing landmarks to figure
    params[:figure][:landmark_ids].each {|landmark| @figure.landmarks << Landmark.find_by_id(landmark)}
    #create new landmark
    if !params[:landmark].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    #assign existing titles
    params[:figure][:title_ids].each {|title| @figure.titles << Title.find_by_id(title)}
    #create new titles
    if !params[:title].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end
  end

  post '/figures/:id' do

  end

end
