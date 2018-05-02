class FiguresController < ApplicationController
  get '/' do
    redirect '/figures'
  end

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    #Create the Figure
    @figure = Figure.create(name: params[:figure][:name])

    #Associate titles
    if !!params[:figure][:title_ids]
      params[:figure][:title_ids].keys.each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end
    @figure.titles.build(name: params[:title][:name]) if !params[:title][:name].empty?

    #Associate landmarks
    if !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].keys.each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end
    @figure.landmarks.build(name: params[:landmark][:name]) if !params[:landmark][:name].empty?

    @figure.save

    redirect "/figures/#{@figure.id}"
  end
end
