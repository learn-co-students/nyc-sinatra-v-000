class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    figure.titles.build(params[:title]) unless params[:title][:name].blank?

    # figure.landmarks << Landmark.new(params[:landmark])
    figure.landmarks.build(params[:landmark]) unless params[:landmark][:name].blank?
    figure.save

    redirect to "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :"figures/edit"
  end
end
