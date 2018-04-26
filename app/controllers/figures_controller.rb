class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'

  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    #binding.pry
  @figure = Figure.create(name: params["figure"]["name"])

  if params["figure"]["title_ids"]!= nil
    params["figure"]["title_ids"].each {|x| @figure.titles << Title.find_by_id(x)}
  end

  if !Title.find_by_name(params["title"]["name"])
    @figure.titles << Title.create(name: params["title"]["name"])
  end

  if params["figure"]["landmark_ids"]!= nil
    params["figure"]["landmark_ids"].each {|x| @figure.landmarks << Landmark.find_by_id(x)}
  end

  if !Landmark.find_by_name(params["landmark"]["name"])
    @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
  end

    @figure.save
    redirect to "/figures/#{@figure.id}"

  end




end
