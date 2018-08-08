class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/show'
  end

  patch '/figures/:id' do
    # update figure
    figure = Figure.find_by(id: params[:id])
    figure.update(params[:figure])
    
    # if a new title was added, create a new title and associate with figure
    if params["title"]["name"] != ""
      new_title = Title.create(params[:title])
      
      FigureTitle.create(title_id: new_title.id, figure_id: figure.id)
    end
    
    # if a new landmark was added, create a new landmark and associate with figure
    if params["landmark"]["name"] != ""
      new_landmark = Landmark.new(params[:landmark])
      new_landmark.figure_id = figure.id
      new_landmark.save
    end
    redirect to "/figures/#{figure.id}"
  end

  post '/figures' do
    # create a new figure
    figure = Figure.create(params[:figure])

    # if a new title was added, create a new title and associate with figure
    if params["title"]["name"] != ""
      new_title = Title.create(params[:title])
      
      FigureTitle.create(title_id: new_title.id, figure_id: figure.id)
    end

  # if a new landmark was added, create a new landmark and associate with figure
  if params["landmark"]["name"] != ""
    new_landmark = Landmark.new(params[:landmark])
    new_landmark.figure_id = figure.id
    new_landmark.save
    end

    redirect to "/figures/#{figure.id}"
  end

end
