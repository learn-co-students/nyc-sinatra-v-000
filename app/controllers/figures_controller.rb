class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
      if @title = Title.find_by_id(params["figure"]["title_ids"])
        @figure.titles << @title
      else
        @title = Title.create(name: params["title"]["name"])
        @figure.titles << @title
        @figure.save
      end
      if @landmark = Landmark.find_by_id(params["figure"]["landmark_ids"])
          @figure.landmarks << @landmark
      else
        @landmark = Landmark.create(name: params["landmark"]["name"])
        @figure.landmarks << @landmark
        @figure.save
      end
    erb :'/figures/index'
  end

end
