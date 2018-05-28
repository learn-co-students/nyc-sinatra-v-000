class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    puts "New Figure params=#{params}"
    @figure = Figure.new(name: params[:figure_name])
    @figure.landmark_ids = params[:landmarks]
    if params[:new_landmark]
      @figure.landmarks << Landmark.new(name: params[:new_landmark])
    end
    @figure.title_ids = params[:titles]
    if params[:new_title]
      @figure.titles << Title.new(name: params[:new_title])
    end
    @figure.save
    erb :'figures/show'
  end
end
