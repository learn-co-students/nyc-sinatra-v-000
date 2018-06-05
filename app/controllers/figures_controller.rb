require 'rack-flash'
require 'rack/flash/test' # => https://github.com/nakajima/rack-flash/issues/1
require 'pry'

class FiguresController < ApplicationController
  use Rack::Flash

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end

    @figure.save

    flash[:message] = "Successfully created Figure."
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure]) # instead of using create

    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    @figure.save

    flash[:message] = "Successfully updated Figure."
    erb :'figures/show'
  end

end