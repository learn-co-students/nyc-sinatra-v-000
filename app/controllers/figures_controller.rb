class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:slug' do
    @figure=Figure.find_by_slug(params[:slug])
    erb :'figures/show'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])
    #binding.pry
    #@figure.titles=params[:figure][:title_ids]
    #@figure.landmarks=params[:figure][:landmark_ids]
    #@figure.title=Title.find_or_create_by(params[:title])
    #@figure.landmark=Landmark.find_or_create_by(params[:landmark])
    redirect("/figure/#{@figure.slug}")
  end

end
