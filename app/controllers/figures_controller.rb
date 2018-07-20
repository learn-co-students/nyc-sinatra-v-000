class FiguresController < ApplicationController

  get '/figures' do #index page request
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do #create page request
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post '/figures' do #create and redirect
    @figure = Figure.create(name: params[:figure][:name])
    redirect "/figures/#{@figure.slug}"
  end

  get '/figures/:slug' do #Show page request
    @figure = Figure.find_by_slug(params[:slug])
    @title = Title.find_by_id(params[:title])

    erb :"figures/show"
  end

end
