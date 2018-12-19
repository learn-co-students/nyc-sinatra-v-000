class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @landmark = Landmark.create(params[:landmark])
    @figure.titles << @title
    @figure.landmarks << @landmark
    @figure.save
    redirect_to :"/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end
end
