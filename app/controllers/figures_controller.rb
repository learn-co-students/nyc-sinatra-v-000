require 'pry'
class FiguresController < ApplicationController


  get '/figures' do
    erb :'/figures/index'
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    #  binding.pry
    figure = Figure.create(name: params[:figure][:name])
    title_ids = params[:figure][:title_ids]
    landmark_ids = params[:figure][:landmark_ids]
    if !title_ids.nil? && !title_ids.empty?
    title_ids.each do |id|
      figure.titles << Title.find_by_id(id)
    end
  end
  if !landmark_ids.nil? && !landmark_ids.empty?
    landmark_ids.each do |id|
      figure.landmarks << Landmark.find_by_id(id)
    end
  end
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.create(name: params[:title][:name])
    end
    figure.save
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    # binding.pry
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    # binding.pry
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    figure = Figure.find_by_id(params[:id])
    figure.update(name: params[:figure][:name])
    title_ids = params[:figure][:title_ids]
    landmark_ids = params[:figure][:landmark_ids]
    titles = []
    landmarks = []
    if !title_ids.nil? && !title_ids.empty?
    title_ids.each do |id|
      titles << Title.find_by_id(id)
    end
  end
  if !landmark_ids.nil? && !landmark_ids.empty?
    landmark_ids.each do |id|
      landmarks << Landmark.find_by_id(id)
    end
  end
  figure.titles = titles
  figure.landmarks = landmarks
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.create(name: params[:title][:name])
    end
    figure.save
    redirect to("/figures/#{figure.id}")

  end

















end
