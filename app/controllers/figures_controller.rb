class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    if @figure.nil?
      "Empty"
    else
      erb :'/figures/edit'
    end
  end
  
  post '/figures' do
    figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      figure.titles << title
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(name: params[:landmark][:name])
      figure.landmarks << landmark
    end
    figure.save
    redirect to '/figures'
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
  
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      title = Title.create(params[:title][:name])
      @figure.titles << title
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark][:name])
      @figure.landmarks << landmark
    end
    redirect to "/figures/#{@figure.id}"
  end
end
