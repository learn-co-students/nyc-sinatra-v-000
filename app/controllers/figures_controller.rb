class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all.sort { |a, b| a.name <=> b.name }
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
    @figure = Figure.create(params[:figure])
    @figure.title_ids = params[:figure][:title_ids]
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.landmark_ids = params[:figure][:landmark_ids]
    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    redirect "/figures/#{@figure.id}"
  end


end
