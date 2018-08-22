require 'pry'
class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    if params["figure"]["title_ids"] != nil
      params["figure"]["title_ids"].each do |id|
        @figure.titles << Title.find_by_id(id)
      end
    else
      @figure.titles << Title.create(params["title"])
    end
    if params["figure"]["landmark_ids"] != nil
      params["figure"]["landmark_ids"].each do |id|
        @figure.landmarks << Landmark.find_by_id(id)
      end
    else
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(name: params["figure"]["name"])
    @figure.titles.clear
    @figure.landmarks.clear
    if params["figure"]["title_ids"] != nil
      params["figure"]["title_ids"].each do |id|
        @figure.titles << Title.find_by_id(id)
      end
      @figure.titles << Title.create(params["title"])
    end
    if params["figure"]["landmark_ids"] != nil
      params["figure"]["landmark_ids"].each do |id|
        @figure.landmarks << Landmark.find_by_id(id)
      end
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
