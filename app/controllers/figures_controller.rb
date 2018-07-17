class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    erb :'figures/show'
  end

  post '/figures' do
    @new_figure = Figure.create(params[:figure])

    unless params[:title][:name].empty?
      @new_figure.titles << Title.new(:name => params[:title][:name])
    end

    unless params[:landmark][:name].empty?
      @new_figure.landmarks << Landmark.new(:name => params[:landmark][:name], :year_completed => params[:landmark][:year])
    end

    @new_figure.save

    redirect to "/figures/#{@new_figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])

    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    @figure.update(params[:figure])

    unless params[:title][:name].empty?
      @figure.titles << Title.new(:name => params[:title][:name])
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.new(:name => params[:landmark][:name], :year_completed => params[:landmark][:year])
    end

    @figure.save

    redirect to "/figures/#{figure.id}"
  end
end
