require 'pry'
class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["landmark"]["name"].empty?
      @figure.landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
    end
    if !params["title"]["name"].empty?
      @figure.title = Title.find_or_create_by(name: params[:title][:name])
    end
binding.pry
  end
end
