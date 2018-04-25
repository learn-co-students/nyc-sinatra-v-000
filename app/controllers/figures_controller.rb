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
    #binding.pry
    #@figure.titles=params[:figure][:title_ids]
    #@figure.landmarks=params[:figure][:landmark_ids]
    #@figure.title=Title.find_or_create_by(params[:title])
    #@figure.landmark=Landmark.find_or_create_by(params[:landmark])
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
  redirect("/figures/#{@figure.id}")
  end

end
