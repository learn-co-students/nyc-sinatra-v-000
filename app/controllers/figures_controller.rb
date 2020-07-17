class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:figure][:title_ids].nil?
      title = Title.create(name: params[:title][:name])
      @figure.titles << title
    end

    if params[:figure][:landmark_ids].nil?
      landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      @figure.landmarks << landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(name: params[:figure][:name])

    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
