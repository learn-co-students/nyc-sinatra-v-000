class FiguresController < ApplicationController
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title][:name]!=nil
      title = Title.create(params[:title])
      @figure.titles << title
    end
    if params[:landmark][:name]!=nil
      new_l = Landmark.create(params[:landmark])
      @figure.landmarks << new_l
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end
end
