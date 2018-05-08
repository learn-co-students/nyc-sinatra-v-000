class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    elsif !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])

    @figure.save
    # binding.pry
    redirect "figures/#{@figure.id}"
    end
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure = @figure.update(params)
    @figure.save
    erb :"/figures/show"
  end
end
