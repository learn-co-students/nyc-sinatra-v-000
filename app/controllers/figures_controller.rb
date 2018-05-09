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
    params[:figure][:landmarks].each {|landmark| @figure.landmarks << landmark}
    #create new landmark
    if !params[:figure][:new_landmark].empty?
      @landmark = Landmark.create(params[:figure][:new_landmark])
      @figure.landmarks << @landmark
    end
    #assign existing titles
    params[:figure][:titles].each {|title| @figure.titles << title}
    #create new titles
    if !params[:figure][:new_title].empty?
      @title = Title.create(name: params[:figure][:new_title][:name])
      @figure.titles << @titles
    end
  end

  post '/figures/:id' do

  end

end
