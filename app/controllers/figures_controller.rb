class FiguresController < ApplicationController

  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    # create new stuff
    # binding.pry
    @figure = Figure.new(params[:figure])

    if !params[:title].empty? && !Title.find_by(params[:title])
      @figure.titles.build(params[:title])
    elsif title = Title.find_by(params[:title])
      @figure.titles << title
    end

    if !params[:landmark].empty? && !Landmark.find_by(params[:landmark])
      @figure.landmarks.build(params[:landmark])
    elsif landmark = Landmark.find_by(params[:landmark])
      @figure.landmarks << landmark
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all

    @figure = Figure.find_by(id: params[:id])
    erb :'figures/edit'
  end

  patch '/figures' do
    @figure = Figure.find_by(params[:figure][:id])

    @figure.update(name: params[:figure][:name])

    if !params[:title].empty? && !Title.find_by(params[:title])
      @figure.titles.build(params[:title])
    elsif title = Title.find_by(params[:title])
      @figure.titles << title
    end

    if !params[:landmark].empty? && !Landmark.find_by(params[:landmark])
      @figure.landmarks.build(params[:landmark])
    elsif landmark = Landmark.find_by(params[:landmark])
      @figure.landmarks << landmark
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
