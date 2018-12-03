require 'rack-flash'

class FiguresController < ApplicationController
use Rack::Flash

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    flash[:message] = "Successfully created new Figure!"

    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    flash[:message] = "Successfully updated Figure."
    redirect "figures/#{@figure.id}"
  end

end
