class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    #binding.pry
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    #binding.pry
    erb :'/figures/show'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(name: params[:figure_name])
    #@figure.title_ids = params[:figure][:title_ids]
    #@figure.landmark_ids = params[:figure][:landmark_ids]

    if params.keys.include?("figure") && !params[:figure][:title_ids].blank?
      @figure.title_ids = params[:figure][:title_ids]
      @figure.save
    elsif params.keys.include?("title") && !params[:title][:name].blank?
      @title = Title.find_or_create_by(name: params[:title][:name])
      @figure.titles << @title
      @title.save
    else
      @figure.save
    end

    if params.keys.include?("figure") && !params[:figure][:landmark_ids].blank?
      @figure.landmark_ids = params[:figure][:landmark_ids]
      @figure.save
    elsif params.keys.include?("landmark") && !params[:landmark][:name].blank?
      @landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << @landmark
      @landmark.save
    else
      @figure.save
    end


    @figure.save

  end

end
