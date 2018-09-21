class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].blank?
    @figure.titles << Title.create(params[:title]) unless params[:title][:name].blank?
    @figure.save
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure][:name])
    @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].blank?
    @figure.titles << Title.create(params[:title]) unless params[:title][:name].blank?
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
