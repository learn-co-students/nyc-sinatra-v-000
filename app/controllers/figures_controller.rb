require 'pry'

class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(name: params[:figure][:name])
    #if existing titles have been selected
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each {|title| @figure.titles << Title.find(title)}
    elsif !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each {|landmark| @figure.landmarks << Landmark.find(landmark)}
    elsif !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    redirect to :"/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    if params[:figure][:title_ids]
      @figure.titles.clear
      params[:figure][:title_ids].each do |title|
          @figure.titles << Title.find(title)
      end
    elsif !params[:figure][:title_ids]
      @figure.titles.clear
    elsif !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end
    if params[:figure][:landmark_ids]
      @figure.landmarks.clear
      params[:figure][:landmark_ids].each do |landmark|
        @figure.landmarks << Landmark.find(landmark)
      end
    elsif !params[:figure][:landmark_ids]
      @figure.landmarks.clear
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.save
    end
    redirect to :"/figures/#{@figure.id}"
  end

end
