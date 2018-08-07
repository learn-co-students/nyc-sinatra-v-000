class FiguresController < ApplicationController

  get '/figures' do
    erb :"/application/figures/index"
  end

  get '/figures/new' do
    erb :'/application/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"/application/figures/show"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/application/figures/edit'
  end

  patch '/figures/:id/edit' do
    @original_figure = Figure.find_by_id(params[:id])
    @original_figure.update(params[:figure])

    if !params[:title][:name].empty?
      @original_figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @original_figure.landmarks << Landmark.create(params[:landmark])
    end
    @original_figure.save

    redirect "/figures/#{@original_figure.id}"
  end
end
