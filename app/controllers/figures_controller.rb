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
    redirect '/figures/#{slug}'
  end


end
