require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      @title=Title.find_or_create_by(params["title"])
      @figure.titles<<@title
    end
    if !params['landmark']["name"].empty?
      @landmark=Landmark.find_or_create_by(params["landmark"])
      @figure.landmarks<<@landmark
    end
    @figure.save
  end

  get '/figures/:id/edit' do
    @figure=Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure=Figure.find(params[:id])
    if !params['landmark']['name'].empty?
      @landmark=Landmark.create(params['landmark'])
      @figure.landmarks<<@landmark
    end
    @figure.update(name:params['figure']['name'])
    @figure.save
    redirect "/figures/#{@figure.id}"
  end



end
