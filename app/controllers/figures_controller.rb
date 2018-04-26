class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'

  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @title = params[:title]
    @landmark = params[:landmark]
    @figure = Figure.create(name: params[:figure][:name])
    if !@title[:name].empty?
      new_title = Title.create(name: @title[:name])
      @figure.titles << new_title
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"

  end




end
