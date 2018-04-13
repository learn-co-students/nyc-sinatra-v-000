class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    if !params[:figure][:title_ids].nil?
      Title.all.each do |title|
        if title.id.to_s == params[:figure][:title_ids].join
          @title = title
          @figure.titles << @title
        end
      end
    end

    if !params[:figure][:landmark_ids].nil?
      Landmark.all.each do |landmark|
        if landmark.id.to_s == params[:figure][:landmark_ids].join
          @landmark = landmark
          @figure.landmarks << @landmark
        end
      end
    end

    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end

    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])

    if !params[:figure][:name].empty?
      @figure.update(name: params[:figure][:name])
    end
   #binding.pry
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark

    end


    erb :'figures/show'
  end
end
