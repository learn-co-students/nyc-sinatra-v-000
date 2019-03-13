class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(params[:figure])

    redirect '/figures/#{@figure.slug}'
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/show'
  end

  get '/figures/:slug/edit' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/edit'
  end

end
