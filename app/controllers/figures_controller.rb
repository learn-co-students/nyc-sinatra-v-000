class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(:name => params[:figure][:name])
    @figure.titles = Title.where(id: params[:figure][:title_ids])
    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.landmarks = Landmark.where(id: params[:figure][:landmark_ids])
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(:name => params[:figure][:name], :landmark_ids => params[:figure][:landmark_ids])
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    erb :"/figures/#{@figure.id}"
  end

end
