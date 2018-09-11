class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    figure = Figure.create(name: params[:figure]["name"])
    if params[:figure].keys.include?("landmark_ids")
      figure.landmarks << Landmark.find(params[:figure]["landmark_ids"].first)
    elsif params[:figure].keys.include?("title_ids")
      figure.titles << Title.find(params[:figure]["title_ids"].first)
    elsif params[:landmark]["name"] != ""
      landmark = Landmark.create(name: params[:landmark]["name"])
      figure.landmarks << landmark
    elsif params[:title]["name"] != ""
      title = Title.create(name: params[:title]["name"])
      figure.titles << title
    end
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(name: params[:figure]["name"])
    if params[:figure].keys.include?("landmark_ids")
      figure.landmark_ids = params[:figure]["landmark_ids"]
    elsif params[:figure].keys.include?("title_ids")
      figure.titles_ids = params[:figure]["title_ids"]
    elsif params[:landmark]["name"] != ""
      landmark = Landmark.create(name: params[:landmark]["name"])
      figure.landmarks << landmark
    elsif params[:title]["name"] != ""
      title = Title.create(name: params[:title]["name"])
      figure.titles << title
    end
    redirect '/figures/' + figure.id
  end

end
