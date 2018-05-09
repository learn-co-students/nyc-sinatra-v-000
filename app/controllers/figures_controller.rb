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
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    #new figure
    @figure= Figure.create(name: params[:figure][:name])
    #assign existing landmarks to figure
    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each {|landmark| @figure.landmarks << Landmark.find_by_id(landmark)}
    end
    #create new landmark
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    #assign existing titles
    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each {|title| @figure.titles << Title.find_by_id(title)}
    end
    #create new titles
    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end
    redirect to "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    #get figure
    @figure= Figure.find_by_id(params[:id])
    #set name
    @figure.name = params[:figure][:name]
    #reset landmarks
    @figure.landmarks.clear
    #assign existing landmarks to figure
    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each {|landmark| @figure.landmarks << Landmark.find_by_id(landmark)}
    end
    #create new landmark
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    #reset titles
    @figure.titles.clear
    #assign existing titles
    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each {|title| @figure.titles << Title.find_by_id(title)}
    end
    #create new titles
    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
