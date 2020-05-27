class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
   
    erb :"/figures/new"
  end

  post '/figures/new' do
    @figure = Figure.create(params[:figure_name])
  end

end







