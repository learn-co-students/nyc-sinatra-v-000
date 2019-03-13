class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(:name => params[:figure][:name])
    if !params[:figure][:title_ids].empty?
      @figure.title_ids = params[:figure][:title_ids]
    else
      @figure.title_ids = Title.create(params[:title])
    end
    @figure.save
    redirect '/figures/#{@figure.slug}'
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/show'
  end


end
