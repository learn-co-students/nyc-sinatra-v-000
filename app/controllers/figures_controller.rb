class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    @figure.titles.build(params["title"]) unless params["title"]["name"].empty?
    @figure.landmarks.build(params["landmark"]) unless params["landmark"]["name"].empty?

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])

    @figure.update(params["figure"])
    @figure.titles.build(params["title"]) unless params["title"]["name"].empty?
    @figure.landmarks.build(params["landmark"]) unless params["landmark"]["name"].empty?

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end
