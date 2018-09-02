class FiguresController < ApplicationController

  get '/figures' do
    @figure = Figure.all
    erb :'figures/index'
  end

  get '/figures' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figure/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
      if !params[:title].empty?
        @figure.titles << Title.create(params[:title])
      end
      if !params[:landmark].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end
      @figure.save
    redirect '/figures/#{@figure.id}'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark].empty?
      @figure.landmark << Landmark.create(params[:landmark])
    end

    @figure.update(params[:figure])
    if !params[:title].empty?
      @figure.title << Title.create(params[:title])
    end
    redirect 'figures/#{@figure.id}'
  end

  get '/figures/:id/delete' do
    @figure = Figure.destory.all
  redirect '/figures'
  end

end
