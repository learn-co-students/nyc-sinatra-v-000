class FiguresController < ApplicationController
  get '/figures/new' do 
    erb :'figures/new'
  end

  post '/figures' do 
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:titles]) if params[:title][:name]
    @figure.landmarks << Landmark.create(params[:landmark]) if params[:landmark][:name]
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures' do 
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do 
    @figure = Figure.find_by(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find_by(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do 
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark]) if params[:landmark][:name]
    @figure.titles << Title.create(params[:titles]) if params[:title][:name]
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
