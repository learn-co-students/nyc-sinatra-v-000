class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  post '/figures' do
    # Figure
    @figure = Figure.create(:name => params[:figure])
    #Creating new titles
    if !params[:title][:name].empty?
      @figure.titles << Title.create(:name => params[:title][:name])
    end
    #Creating new landmarks
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end
    redirect "figures/#{@figure.id}"
  end

end
