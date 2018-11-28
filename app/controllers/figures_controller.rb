class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures"
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

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark][:name])
    end
    @figure.save

   redirect "figures/#{@figure.id}"
  end
end
