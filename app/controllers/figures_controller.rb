class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all.sort { |a, b| a.name <=> b.name }
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all.sort { |a, b| a.name <=> b.name}
    @landmarks = Landmark.all.sort { |a, b| a.name <=> b.name }
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    @figure.title_ids = params[:figure][:title_ids]
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.landmark_ids = params[:figure][:landmark_ids]
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all.sort { |a, b| a.name <=> b.name}
    @landmarks = Landmark.all.sort { |a, b| a.name <=> b.name }
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    @figure.title_ids = params[:figure][:title_ids]
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.landmark_ids = params[:figure][:landmark_ids]
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end
