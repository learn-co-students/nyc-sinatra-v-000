class FiguresController < ApplicationController
  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
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
    figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      figure.titles << title
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      figure.landmarks << landmark
    end
    redirect "/figures/#{figure.id}"
  end

  post '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      figure.titles << title
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      figure.landmarks << landmark
    end
    redirect "/figures/#{figure.id}"
  end
end
