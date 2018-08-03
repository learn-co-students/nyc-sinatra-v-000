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

  post '/figures' do

    @figure = Figure.create(params["figure"])

    if !params[:landmark][:name].empty?
      @landmark = params[:landmark]
      Landmark.create(:name => @landmark[:name], :figure_id => @figure.id, :year_completed => @landmark[:year_completed])
    end

    if !params["title"]["name"].empty?
      @title = Title.create(params[:title])
      FigureTitle.create(:title_id => @title.id, :figure_id => @figure.id)
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

end
