class FiguresController < ApplicationController

  get '/figures'do
    @figures = Figure.all
    erb :'figures/index'
  end

  get  '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])

    if !params[:title].blank?
      title = Title.create(params[:title])
      figure.titles << title
      figure.save
    end

    if !params[:landmark][:name].blank?
      landmark = Landmark.create(params[:landmark])
      figure.landmarks << landmark
      figure.save
    end

  end

end
