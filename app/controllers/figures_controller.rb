class FiguresController < ApplicationController
  get '/figures' do 
    @figures = Figures.all
    erb :'/figures/index'
  end

  get '/figures/new' do 
    erb :'figures/new'
  end

  post '/figures' do 
    @figure = Figure.new(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles.build(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks.build(name: params[:landmark][:name])
    end

    @figure.save
    redirect to "figures/#{@figure.id}"
  end
end
