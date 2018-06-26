class FiguresController < ApplicationController

  #index action
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  #new action
  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @landmark = Landmark.create(params[:landmark])
    @title = Title.create(params[:title])
    # @figure.titles << params["figure"]["title_ids"][]
    if !params[:title][:name].empty? && !@figure.landmarks.include?(@title)
      @figure.titles << @title
    else
    end

    if !params[:landmark][:name].empty? && !@figure.landmarks.include?(@landmark)
      @figure.landmarks << @landmark
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  #show action
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  #edit action
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    # @figure = Figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end



end
