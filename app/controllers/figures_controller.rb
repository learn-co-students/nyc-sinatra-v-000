require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:landmark].empty?
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end
    if !params[:title].empty?
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
  
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark].empty?
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end
    if !params[:title].empty?
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    @figure.save
    redirect :"/figures/#{@figure.id}"
  end


end
