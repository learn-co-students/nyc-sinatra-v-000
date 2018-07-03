class FiguresController < ApplicationController

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures/new' do
    # binding.pry
    @figure = Figure.create(name: params[:figure_name])

    if !!params[:figure][:title_ids]
      @figure.titles << Title.find(params[:title_ids])
    end
    if !!params[:landmark_ids]
      @figure.landmarks << Landmark.find(params[:landmark_ids])
    end
    @title = Title.create(name: params[:new_title])
    @figure.titles << @title
    @figure.landmarks << Landmark.create(name: params[:new_landmark])
  end

  get '/figures' do
    erb :"figures/index"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure_name])
    @figure.landmarks << Landmark.find_or_create_by(name: params[:new_landmark])

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end





end
