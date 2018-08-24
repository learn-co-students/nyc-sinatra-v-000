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
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
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


end
