class FiguresController < ApplicationController

  get '/figures' do #READ all figures
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do #CREATE: make new figures form
    @landmark = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do #CREATE: creates the new instance of figures
    @figure = Figure.new(params[:figure])

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"

  end

  get '/figures/:id' do #READ: view specific figure
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do #UPDATE: edit a specific figure
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do #UPDATE: edit instance of the figure
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
