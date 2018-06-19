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
    figure = Figure.new(params[:figure])
    if !params[:title][:name].strip.empty?
      figure.titles << Title.find_or_create_by(params[:title])
    end
    if !params[:landmark][:name].strip.empty?
      figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id]) || (return 404)
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id]) || (return 404)
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find_by(id: params[:id]) || (return 404)
    figure.update(params[:figure])
    if !params[:title][:name].strip.empty?
      figure.titles << Title.find_or_create_by(params[:title])
    end
    if !params[:landmark][:name].strip.empty?
      figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    figure.save
    redirect "/figures/#{params[:id]}"
  end
end
