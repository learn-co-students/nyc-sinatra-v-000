class FiguresController < ApplicationController
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

  get '/figures' do
    @figures = Figure.all
    erb:'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb:'/figures/new'
  end

  post '/figures' do
    # submit form
    @figure = Figure.create(params["figure"])

    # adding a new figure
    if params['title']
      @title = Title.create(params['title'])
      @figure.titles << @title
    end

   # adding a new landmark
    if params['landmark']
      @landmark = Landmark.create(params['new_landmark'])
      @figure.landmarks << @landmark
    end

    @figure.save
# test required ID vs slug - had to update
    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id' do
     @figure = Figure.find(params[:id])
     @landmarks = @figure.landmarks
     @titles = @figure.titles

    erb:'figures/show'
  end


  get '/figures/:id/edit' do

    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb:'/figures/edit'
  end

  patch '/figures/:id' do
    # submit form
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    # adding a new figure
    if params['title']
      @title = Title.create(params['title'])
      @figure.titles << @title
    end

   # adding a new landmark
    if params['landmark']
      @landmark = Landmark.create(params['landmark'])
      @figure.landmarks << @landmark
    end

    @figure.save
  # test required ID vs slug - had to update
    redirect to "figures/#{@figure.id}"

  end


end
