class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save

    redirect("/figures/#{@figure.id}")
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/show'
  end
end
