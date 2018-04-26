class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure=Figure.find_by(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])
    if params[:landmark]["name"] != ""
      @landmark=Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    if params[:title]["name"] != ""
      @title=Title.create(params[:title])
      FigureTitle.create(title_id: @title.id, figure_id: @figure.id)
    end
    redirect("/figure/#{@figure.id}")
  end

  get '/figures/:id/edit' do
    @figure=Figure.find_by(params[:id])
  erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure=Figure.find_by(params[:id])
    @figure.update(params[:figure])
    @figure.save
    @landmark=Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
    @landmark.save
  redirect("/figures/#{@figure.id}")
  end

end
