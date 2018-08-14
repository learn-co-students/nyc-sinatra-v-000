class FiguresController < ApplicationController

  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    # create new stuff
    # binding.pry
    @figure = Figure.new(params[:figure])

    @figure.titles.build(params[:title]) if !params[:title].empty?
    @figure.landmarks.build(params[:landmark]) if !params[:landmark].empty?

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/show'
  end
end
