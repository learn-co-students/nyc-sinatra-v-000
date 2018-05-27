class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    puts "New Figure params=#{params}"
    @figure = Figure.new(params[:figure_name])
  end
end
