class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !!params[:title][:name]
      @figure.titles << Title.create(params[:title])
    end
    if !!params[:landmark][:name]
      @figure.landmarks << Landmark.create(params[:landmark])
    end
     @figure.save
     redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

patch '/figures/:id' do
  @figure = Figure.find_by_id(params[:id])
  @figure.update(params[:figure])
  @figure.landmarks.update(params[:landmark][])
  redirect to "/figures/#{@figure.id}"
 end

end
