class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure_name])
    if params[:new_title]
      @title = Title.create(name: params[:new_title])
      @figure.title = @title
    else
      @figure.title = params[:title]
    end
  end

end
