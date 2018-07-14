class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    if params[:title][:name] != ""
      @figure.titles << Title.find_or_create_by(params[:title])
    end
    @figure.save
    redirect("/figures/#{@figure.id}")
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    if params[:title][:name] != ""
      @figure.titles << Title.find_or_create_by(params[:title])
    end
    @figure.save
    redirect("/figures/#{@figure.id}")
  end
end
