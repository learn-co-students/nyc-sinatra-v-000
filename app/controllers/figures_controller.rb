class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post '/figures' do

    @figure = Figure.create(params["figure"])
    # binding.pry
    # Landmark.find_by(id: params["figure"]["landmark_ids"])
    if params["title"]["name"] != ""
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end

    if params["landmark"]["name"] != ""
      @landmark = Landmark.create(params["landmark"])
      @figure.landmarks << @landmark
    end
    @figure.save
    @figures = Figure.all
    # erb :"figures/index"
  end

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/:id' do
    # binding.pry
    @figure = Figure.find_by(id: params["id"])
    # @titles = @figure.titles
    erb :"figures/show"
  end

  get 'figures/:id/edit' do

  end
end
