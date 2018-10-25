require 'pry'
class FiguresController < ApplicationController
  # add controller methods

  get "/figures" do
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
    @figure.titles << Title.find_or_create_by(params[:title])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])

    @figure.save

    redirect to :"/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
   @figure = Figure.find_by_id(params[:id])

   erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    @figure.update(name: params[:figure][:name])
    @figure.titles << Title.find_or_create_by(params[:title])
    @figure.landmarks << Landmarks.find_or_create_by(params[:landmark])

    @figure.save

    redirect to '/figures/#{@figure.id}'
  end
end
