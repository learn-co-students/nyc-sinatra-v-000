require 'pry'

class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end



  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do

    #create figure
    @figure = Figure.new(params[:figure])

    #assign a non=existing titles
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])

    end

    #assign a non-existing landmark

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end

  @figure.save

  end




  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    #assign a non=existing titles
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])

    end

    #assign a non-existing landmark

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end

  @figure.save

  redirect "/figures/#{@figure.id}"
  end




end
