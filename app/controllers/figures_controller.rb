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

  post '/figures' do
    # Figure
    @figure = Figure.create(:name => params["figure"]["name"],
    :title_ids => params["figure"]["title_ids"],
    :landmark_ids => params["figure"]["landmark_ids"])
    #Creating new titles

    if !params[:title][:name].empty?
      @figure.titles << Title.create(:name => params[:title][:name])
    end
    #Creating new landmarks
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end


  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params["figure"]["name"]
    @figure.titles << Title.create(:name => params[:title][:name])  if !params[:title][:name].empty?
    @figure.landmarks << Landmark.create(:name => params[:landmark][:name])  if !params[:landmark][:name].empty?
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

end
