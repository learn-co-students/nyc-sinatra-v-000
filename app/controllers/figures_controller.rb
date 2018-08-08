class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end

    if !params[:landmark].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end

    redirect "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    # @figure.titles.clear
    # params[:figure][:title_ids].each do |title_id|
    #   @figure.titles << Title.find_by_id(title_id)
    # end
    #
    # @figure.landmarks.clear
    # params[:figure][:landmark_ids].each do |landmark_id|
    #   @figures.landmarks << Landmark.find_by_id(landmark_id)
    # end

    if !params[:title].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end

    if !params[:landmark].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end


    @figure.save
    erb :'/figures/show'
  end

end
