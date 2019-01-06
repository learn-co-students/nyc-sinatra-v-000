class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles.build(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks.build(name: params[:landmark][:name])
    end
    @figure.save

    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])

    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])

    erb :'figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles.build(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks.build(name: params[:landmark][:name])
    end
    @figure.save

    redirect "figures/#{@figure.id}"
  end
end
