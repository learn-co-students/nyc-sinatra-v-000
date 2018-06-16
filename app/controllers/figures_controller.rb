class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    #creates a new Figure instance if one for that name doesn't already exist
    @figure = Figure.create(params["figure"])

    #if a unique title is entered in the title textfield, a new Title instance is created/associated to @figure
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])
    end
    #if a unique landmark is entered in the landmark textfield, a new Landmark instance is created/associated to @figure
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    @figure.save
    redirect to :"/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    #if a unique title is entered into the title textfield, it is associated to @figure
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    #if a unique landmark is entered into the landmark textfield, a new landmark is created/associated to @figure
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    @figure.save
    redirect to :"/figures/#{@figure.id}"
  end

  delete '/figures/:id/delete' do
    Figure.delete(params[:id])

    redirect to :'/figures'
  end

end
