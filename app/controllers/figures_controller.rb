class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !@figure.title_ids.empty?
      @figure.title_ids.each do |id|
        @figure.titles << Title.find_by_id(id)
      end
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !@figure.landmark_ids.empty?
      @figure.landmark_ids.each do |id|
        @figure.landmarks << Landmark.find_by_id(id)
      end
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    # binding.pry
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end
end
