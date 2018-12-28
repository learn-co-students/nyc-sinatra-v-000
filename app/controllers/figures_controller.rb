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

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(:name => params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    @figure.save
    redirect to ("/figures/#{@figure.id}")
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(:name => params[:figure][:name])
    if !params[:figure][:title_ids].empty?
      @figure.replace_titles(params[:figure][:title_ids])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(:name => params[:title][:name])
    end

    if !params[:figure][:landmark_ids].empty?
      @figure.replace_landmarks(params[:figure][:landmark_ids])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end

    @figure.save
    redirect to ("/figures/#{@figure.id}")
  end
end
