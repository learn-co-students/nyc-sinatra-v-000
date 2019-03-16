require 'pry'

class FiguresController < ApplicationController

  get "/figures" do
     @figures = Figure.all
     erb :'index'
  end

  get "/figures/new" do
     @titles = Title.all
     @landmarks = Landmark.all
     erb :'/figures/new'
  end

  post "/figures" do
    @figure = Figure.new(name: params[:figure][:name])

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
       @figure.titles << Title.find(id)
      end
    elsif !params[:title][:name].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
       @figure.landmarks << Landmark.find(id)
      end
    elsif !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  post "/figures/:id" do
     @figure = Figure.find(params[:id])
     @figure.update(params["figure"])
     redirect "/figures/#{@landmark.id}"
  end


  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
    # binding.pry
  end


end
