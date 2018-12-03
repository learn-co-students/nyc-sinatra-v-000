class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params["Name"])
    #some kind of logic that says if params of Title.find_or_create_by is "", then do the radio buttons
    @figure.title_ids = params[:titles]
    @figure.landmark_ids = params[:landmarks]
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    
    erb :'figures/show'
  end



end
