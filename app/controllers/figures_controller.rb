class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark

    if params[:title][:name] != ""
      new_title = Title.create(name: params[:title][:name])
      @figure.titles << new_title
      @figure.save
    end
    redirect "figures/#{@figure.id}"
  end

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end


  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do

    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    landmark = Landmark.create(name: params[:figure][:landmark][:name])
    @figure.landmarks << landmark
   redirect "figures/#{@figure.id}"
  end


end
