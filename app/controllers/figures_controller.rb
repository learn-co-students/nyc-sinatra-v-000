class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.find_by(name: params["figure"]["name"])

    if figure
      redirect :"/figures/#{figure.id}/edit"
    else
      new_figure = Figure.create(params["figure"])
      new_figure.titles << Title.find_or_create_by(params["title"]) if valid(params["title"]["name"])
      new_figure.landmarks << Landmark.find_or_create_by(params["landmark"]) if valid(params["landmark"]["name"])
      new_figure.save

      redirect :"/figures/#{new_figure.id}"
    end
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :"figures/edit"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params["figure"])
    figure.titles << Title.find_or_create_by(params["title"]) if valid(params["title"]["name"])
    figure.landmarks << Landmark.find_or_create_by(params["landmark"]) if valid(params["landmark"]["name"])
    figure.save

    redirect :"/figures/#{figure.id}"
  end

  helpers do
    def valid(input)
      !input.strip.empty?
    end
  end

end
