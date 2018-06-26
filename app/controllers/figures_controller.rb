class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])

    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(:name => params["figure_name"])
    @figure.title = params[:title] || Title.find_or_create_by(:name => params["title"])
    @figure.landmark = params[:landmark] || Landmark.find_or_create_by(:name => params["landmark"])
    @figure.save

    redirect("/figures/#{@figure.slug}")
  end

end
