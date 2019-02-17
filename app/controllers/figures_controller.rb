class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  post '/figures' do
   @figure = Figure.create(params[:figure])
   @figure.titles << Title.create(params[:title])
   @figure.landmarks << Landmark.create(name: params[:landmark][:new_landmark], year_completed: params[:landmark][:year_completed])
   @figure.save

   redirect :"/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
   @figure = Figure.find(params[:id])
   @figure.update(params[:figure])
   @figure.titles << Title.create(params[:title]) if !params[:title][:name].empty?
   @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year]) if !params[:landmark][:name].empty?
   @figure.save

   redirect :"/figures/#{@figure.id}"
  end

end
