class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    #binding.pry
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    #binding.pry
    @figure = Figure.find(params["id"])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    #binding.pry
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params["figure"])

    if !params[:landmark][:name].empty?
      #binding.pry
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    end

    if !params[:title][:name].empty?
      #binding.pry
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end
    #binding.pry
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params["title"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end



end
