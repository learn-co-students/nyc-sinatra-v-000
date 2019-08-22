class FiguresController < ApplicationController
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
    "Figure #{params[:id]} has been created."
  end
end
