class FiguresController < ApplicationController
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:new_title].present?
      title = Title.create(params[:new_title])
      @figure.titles << title
    end
    if params[:new_landmark].present?
      landmark = Landmark.create(params[:new_landmark])
      @figure.landmarks << landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end
  
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:new_title].present?
      title = Title.create(params[:new_title])
      @figure.titles << title
    end
    if params[:new_landmark].present?
      landmark = Landmark.create(params[:new_landmark])
      @figure.landmarks << landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  
end
