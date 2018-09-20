class FiguresController < ApplicationController
  get '/figures/new' do
    erb :new
  end

  post '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :show
  end
end
