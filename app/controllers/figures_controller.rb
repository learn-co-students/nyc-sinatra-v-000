class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure=Figure.find_by(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])
    if params[:landmark]["name"] != ""
      @landmark=Landmark.create(params[:landmark])
      #@landmark.figure=@figure
      binding.pry
    end
    if params[:title]["name"] != ""
      @title=Title.create(params[:title])
      FigureTitle.create(title_id: @title.id, figure_id: @figure.id)
    end
    #binding.pry
    params[:figure]["title_ids"].each do |id|
      FigureTitle.create(title_id: id, figure_id: @figure.id)
    end
    params[:figure]["landmark_ids"].each do |id|
      Landmark.find(id).figure=@figure
    end

    #@figure.titles=params[:figure][:title_ids]
    #@figure.landmarks=params[:figure][:landmark_ids]
    #@figure.title=Title.find_or_create_by(params[:title])
    #@figure.landmark=Landmark.find_or_create_by(params[:landmark])
    redirect("/figure/#{@figure.id}")
  end

  get '/figures/:id/edit' do
    @figure=Figure.find_by(params[:id])
  erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure=Figure.find_by(params[:id])
    @figure.update(params[:figure])
    @figure.save
  redirect("/figures/#{@figure.id}")
  end

end
