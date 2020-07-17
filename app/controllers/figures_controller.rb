class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @figure = Figure.create
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    if params[:figure][:title_ids] != nil
      @figure.titles = Title.find(params[:figure][:title_ids])
    end
    if params[:title][:name] != ""
      new_title = Title.create(name: params[:title][:name])
      @figure.titles << new_title
    end

    if params[:figure][:landmark_ids] != nil
      @figure.landmarks = Landmark.find(params[:figure][:landmark_ids])
    end
    if params[:landmark][:name] != ""
      new_landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << new_landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    #binding.pry
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:name]
    @figure.year_completed = params[:year_completed]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
