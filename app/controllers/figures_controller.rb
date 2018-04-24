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
    binding.pry
    @figure.titles=params[:title_ids]
    binding.pry
    redirect("/figure/#{@figure.slug}")
  end

end
