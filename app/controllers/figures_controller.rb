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
    @figure = Figure.create(params[:figure])
    title_ids = params[:figure]["title_ids"]
    title_ids.each do |id|
      title = Title.find(id)
      @figure.titles << title
      @figure.figure_titles.create(title: title)
    end
    title = Title.find_or_create_by(name: params[:title]["name"])
    @figure.titles << title
    landmark = Landmark.create(params[:landmark])
    @figure.landmarks << landmark
    @figure.figure_titles.create(title: title)
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure]["name"])
    @figure.save
    @figure.titles.destroy_all
    @figure.landmarks.destroy_all
    @figure.name = 
    title = Title.create(params[:title])
    @figure.titles << title
    landmark = Landmark.create(params[:landmark])
    @figure.landmarks << landmark
    @figure.figure_titles.create(title: title)
    redirect "/figures/#{@figure.id}"
  end
end