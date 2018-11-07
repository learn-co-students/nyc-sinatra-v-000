class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post '/figures' do

    @figure = Figure.create(params["figure"])
    binding.pry
    # Landmark.find_by(id: params["figure"]["landmark_ids"])
    if params["title"]["name"]
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
      @figure.save
    end

    @figures = Figure.all
    erb :"figures/index"
  end
end
