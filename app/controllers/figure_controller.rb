class FiguresController < ApplicationController

get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figure/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
      if params[:figure][:title].empty?
        @figure.titles << Title.create(params[:title])
      end
      if params[:figure][:landmark].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end
      @figure.save
    redirect '/figures/#{@figure.id}'
  end

  patch '/figures/:id' do
    @figure=Figure.find(params[:id])
      if !params[:figure][:id].empty?
        @figures << Figure.create[:figure]
      @figure.save

    end
        redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/delete' do
    @figure = Figure.destory.all
  redirect '/figures'
  end

end
