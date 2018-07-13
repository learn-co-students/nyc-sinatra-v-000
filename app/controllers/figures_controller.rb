class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @title_ids = []
    if !params[:title][:name].empty?
      @title_ids << Title.create(params[:title])
    end
    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |title|
        id = title.gsub("title_","").to_i
        @title_ids << Title.find(id)
      end
    end

    @landmark_ids = []
    if !params[:landmark][:name].empty?
      @landmark_ids << Landmark.create(name: params[:landmark][:name])
    end
    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |landmark|
        id = landmark.gsub("landmark_","").to_i
        @landmark_ids << Landmark.find(id)
      end
    end

    @figure = Figure.find_by(name: params[:figure][:name]) || Figure.create(name: "#{params[:figure][:name]}")
    @figure.landmarks = @landmark_ids
    @figure.titles = @title_ids
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
