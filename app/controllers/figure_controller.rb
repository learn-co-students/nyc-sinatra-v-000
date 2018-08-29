class FiguresController < ApplicationController

  get '/figures/new' do
    @figures = Figure.all
    erb :'figures/new'
  end


  get '/figures' do
    @figure = Figure.create(params[:name])
   redirect 'figures/new'
  end

  get "/figures" do

  end


end
