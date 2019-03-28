class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.name = params[:figure_name]
    @figure.save
    @figure.titles << Title.create(:name=> params[:title][:name])
    @figure.landmarks << Landmark.create(:name=> params[:landmark][:name])
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure_name]

    @figure.save
    @figure.landmarks << params[:new_landmark]

    redirect "/figures/#{@figure.id}"
  end

end
