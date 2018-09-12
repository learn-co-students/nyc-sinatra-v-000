class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.new(name: params[:figure][:name])
    if params[:new_title]
      @title = Title.create(name: params[:new_title])
      @figure.title = @title
    else
      @figure.title = params[:title]
    end
    @figure.save
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]
    @figure.save
  end

end
