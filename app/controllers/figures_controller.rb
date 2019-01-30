class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    #list all figures
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
    end
  end

  get '/figures/:id' do
    #see a single figure
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    #edit a single figure
    erb :'figures/edit'
  end

  patch '/figures/:id' do

  end



end
