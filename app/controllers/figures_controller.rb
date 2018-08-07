require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    erb :"/application/index"
  end

  get '/figures/new' do
    erb :'/application/figures/new'
  end

  get '/figures/:id' do
    @current_figure = Figure.find_by_id(params[:id])
    erb :"/application/figures/show"
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        @title = Title.find_by_id(id)
        @figure.titles << @title
      end
    end

    if params[:title][:name]
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        @landmark = Landmark.find_by_id(id)
        @figure.landmarks << @landmark
      end
    end

    if params[:landmark][:name]
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
    @figure.save
  end

  get '/figures/:id/edit' do
    erb :'/application/figures/edit'
  end
end
