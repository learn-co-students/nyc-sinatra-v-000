require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    erb :"/application/index"
  end

  get '/figures/new' do
    erb :'/application/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
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

    if params[:title][:name] != ""
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        @landmark = Landmark.find_by_id(id)
        @figure.landmarks << @landmark
      end
    end

    if params[:landmark][:name] != ""
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/application/figures/edit'
  end

  patch '/figures/:id/edit' do
    @original_figure = Figure.find_by_id(params[:id])
    @original_figure.name = params[:figure][:name]
    @original_figure.titles.clear
    @original_figure.landmarks.clear

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        @title = Title.find_by_id(id)
        @original_figure.titles << @title
      end
    end


    if params[:title][:name] != ""
      @title = Title.create(name: params[:title][:name])
      @original_figure.titles << @title
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        @landmark = Landmark.find_by_id(id)
        @original_figure.landmarks << @landmark
      end
    end

    if params[:landmark][:name] != ""
      @landmark = Landmark.create(name: params[:landmark][:name])
      @original_figure.landmarks << @landmark
    end

    @original_figure.save
    redirect "/figures/#{@original_figure.id}"
  end
end
