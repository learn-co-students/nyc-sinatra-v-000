class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.create(name: params[:figure][:name])

    params[:figure][:title_ids].each do |ft|
      @figure_title = FigureTitle.create(title_id: ft)
      @figure_title.figure_id = @figure.id
      @figure_title.save
    end

    binding.pry

  end

end
