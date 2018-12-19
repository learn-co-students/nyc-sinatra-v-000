class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @landmark = Landmark.create(params[:landmark])
    @figure.titles << @title
    @figure.landmarks << @landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty? && !params[:landmark][:name].empty?
      @title = Title.create(params[:title]) && @landmark = Landmark.create(params[:landmark])
      @figure.titles << @title && @figure.landmarks << @landmark
      @figure.save
    elsif !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
      @figure.save
    else !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
      @figure.save
    end
    redirect "/figures/#{@figure.id}"
  end
end
