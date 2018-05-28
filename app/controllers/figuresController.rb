class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  patch '/figures/:id' do
      @figure = Figure.find(params[:id])
      @figure.update (params[:figure])
      if params[:landmark][:name]
        @figure.landmarks << Landmark.new(params[:landmark])
      end
      if params[:title][:name]
        @figure.titles << Title.new(params[:title])
      end
      @figure.save
      redirect :"/figures/#{@figure.id}"
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    if params[:landmark][:name]
      @figure.landmarks << Landmark.new(params[:landmark])
    end
    if params[:title][:name]
      @figure.titles << Title.new(params[:title])
    end
    @figure.save
    erb :'figures/show'
  end
end
