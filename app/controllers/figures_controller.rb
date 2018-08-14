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
    figure = Figure.new(params[:figure])

    if !params[:title][:name].nil?
      title = Title.find_or_create_by(name: params[:title][:name])
      figure.titles << title
    end

    if !params[:landmark][:name].nil?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])

      if !params[:landmark][:year_completed].nil?
        landmark.year_completed = params[:landmark][:year_completed]
      end

      figure.landmarks << landmark
    end

    figure.save

    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    # binding.pry
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    erb :'figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].nil?
      title = Title.find_or_create_by(name: params[:title][:name])
      @figure.titles << title
    end

    if !params[:landmark][:name].nil?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << landmark
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end
end
