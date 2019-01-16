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
    @figure = Figure.create(:name => params["figure"]["name"].split.map(&:capitalize)*' ',
    :title_ids => params["figure"]["title_ids"],
    :landmark_ids => params["figure"]["landmark_ids"])
    #Creating new titles
  
    if !params[:title][:name].empty?
      @figure.titles << Title.create(:name => params[:title][:name].split.map(&:capitalize)*' ')
    end
    #Creating new landmarks
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name].split.map(&:capitalize)*' ')
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end

end
