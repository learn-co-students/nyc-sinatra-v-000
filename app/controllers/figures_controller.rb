require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(name: params[:figure][:name])


    if params[:title][:name].empty?
    @figure.title_ids = params[:figure][:title_ids]
    @figure.save
  elsif !params[:title][:name].empty?
    @title = Title.create(name: params[:title][:name])
    @figure.titles << @title
    @figure.save
    end
    #  binding.pry
    if !params[:landmark][:name].empty?
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed], figure_id: @figure.id)
    @figure.landmarks << @landmark
    @figure.save
  elsif !params[:figure][:landmark_ids].empty?
    @landmark = Landmark.find_by_id(params[:figure][:landmark_ids][0].to_i)
    @figure.landmarks << @landmark
    @figure.save
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    #binding.pry
  erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
  erb :'figures/edit'
  end

  post '/figures/:id' do
  #  binding.pry
    @figure = Figure.find_by_id(params[:id])
    #@title = Title.find_by_id(@figure.)
    @figure.name = params["figure"]["name"]
        @figure.save
    @landmark.name = params["landmark"]["name"]
    @landmark.save

  redirect to "/figures/#{@figure.id}"
end

end
