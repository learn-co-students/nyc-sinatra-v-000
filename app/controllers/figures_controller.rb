class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    # update figure
    figure = Figure.find_by(id: params[:id])
    figure.update(params[:figure])
    
    # if a new title was added, create a new title and add to figures
    if !params["title"]["name"].empty?
      figure.titles << Title.create(params[:title])
    end
    
    # if a new landmark was added, create a new landmark and add to figures
    if !params["landmark"]["name"].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    
    redirect to "/figures/#{figure.id}"
  end

  post '/figures' do
    # create a new figure
    figure = Figure.create(params[:figure])

    # if a new title was added, create a new title add to figures
    if !params["title"]["name"].empty?
      figure.titles << Title.create(params[:title])
    end

    # if a new landmark was added, create a new landmark and add to figures
    if !params["landmark"]["name"].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end

    redirect to "/figures/#{figure.id}"
  end

end
