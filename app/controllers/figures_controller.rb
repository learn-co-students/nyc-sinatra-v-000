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

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
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

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(name: params["figure"]["name"])
    @figure.titles.each do |title|
      if title.name != nil && title.name != params["title"]["name"]
        if @title = Title.find_by_name(name: params["title"]["name"])
          @figure.titles << @title
        else @title = Title.create(name: params["title"]["name"])
          @figure.titles << @title
        end
      end
    end
  
    @figure.landmarks.each do |landmark|
      if landmark.name != nil && landmark.name != params["landmark"]["name"]
        if @landmark = Landmark.find_by_name(name: params["landmark"]["name"])
          @figure.landmarks << @landmark
        else @landmark = Landmark.create(name: params["landmark"]["name"])
          @figure.landmarks << @landmark
        end
      end
    end
    erb :'/figures/show'
  end


end
