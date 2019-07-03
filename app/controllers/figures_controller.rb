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
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])

    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    # binding.pry

    @figure.update(params[:figure])
    @landmark = Landmark.find_or_create_by(params[:landmark])
    if !@figure.landmarks.include?(@landmark)
      @figure.landmarks << @landmark
    end

    # @title = Title.find_or_create_by(params)
    redirect to "/figures/#{@figure.id}"
  end
  
end
