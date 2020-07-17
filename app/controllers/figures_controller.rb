require 'pry'

class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])

    @figure.save
    redirect to ("/figures/#{@figure.id}")
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.titles << Title.find_or_create(params[:title])

    @figure.save
    redirect to ("/figures/#{@figure.id}")
  end
end
