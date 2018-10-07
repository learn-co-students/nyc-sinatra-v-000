class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    #different params depending on if created new or checked preexisting
    if @figure = Figure.find_by_id(params[:id])
    else
      @figure = Figure.create(name: params["figure"]["name"])
    end
    if !params["title"]["name"].empty? #need .empty b/c "" returns as true
      #needs to be titles b/c has many titles and same for landmarks
      @figure.titles << Title.create(name: params["title"]["name"])
    elsif params["figure"]["title_ids"] #don't need empty here-will just automatically return value or nil
      @figure.titles << Title.find_by_id(params["figure"]["title_ids"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    elsif params["figure"]["landmark_ids"]
      @figure.landmarks << Landmark.find_by_id(params["figure"]["landmark_ids"])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    if
      @figure = Figure.find_by_id(params[:id])
    else
      @figure = Figure.create(name: params["name"])
    end
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params["figure"]["name"]
    if !params["title"]["name"].empty?
      #needs to be titles b/c has many titles and same for landmarks
      @figure.titles << Title.create(name: params["title"]["name"])
    elsif params["figure"]["title_ids"]
      @figure.titles << Title.find_by_id(params["figure"]["title_ids"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    else params["figure"]["landmark_ids"]
      @figure.landmarks << Landmark.find_by_id(params["figure"]["landmark_ids"])
    end
    @figure.save
    erb :'figures/show'
  end


end
