class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb:'/landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    @titles = Title.all

    erb:'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params['landmark'])

    if params['titles']
      @title = Title.create(params['title'])
      @landmark.titles << @title
    end

    if params['figure']
      @figure = Figure.create(params['figure'])
      @landmark.figures << @figure
    end

    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb:'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id([params[:id]])
    # binding.pry
    @figures = Figure.all

    erb:'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']

    if params['titles']
      @title = Title.create(params['title'])
      @landmark.titles << @title
    end

    if params['figure']
      @figure = Figure.create(params['figure'])
      @landmark.figure = @figure
    end

    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end


end
