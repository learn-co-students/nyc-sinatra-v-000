class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:landmark].empty?
      @figure.landmarks.build(params[:landmark])
    end

    if !params[:title].empty?
      @figure.titles.build(params[:title])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark].empty?
      @figure.landmarks.build(params[:landmark])
    end

    if !params[:title].empty?
      @figure.titles.build(params[:title])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end


end
