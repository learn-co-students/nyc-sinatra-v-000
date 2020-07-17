class FiguresController < ApplicationController
  # add controller methods
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
    figure = Figure.create(params[:figure])
    if !params[:title].empty?
      figure.titles << Title.new(params[:title])
    end
    if !params[:landmark].empty?
      figure.landmarks << Landmark.new(params[:landmark])
    end
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    params[:figure][:title_ids] = [] if !params[:figure].keys.include?('title_ids')
    params[:figure][:landmark_ids] = [] if !params[:figure].keys.include?('landmark_ids')

    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.new(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.new(params[:landmark])
    end
    redirect "/figures/#{@figure.id}"
  end

end
