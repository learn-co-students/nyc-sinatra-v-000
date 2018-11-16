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

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title]) if !params[:title].blank?
    @figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark][:name].blank?
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.titles << Title.create(params[:title]) unless params[:title].blank?
    @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].blank?
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
