class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  post '/figures' do 
    # raise params.inspect
    fig_name = params[:figure][:name]
    land_name = params[:landmark][:name]
    land_year = params[:landmark][:year]
    title_name = params[:title][:name]
    

    

    @figure = Figure.create(:name => fig_name)
    @landmark = Landmark.create(:name => land_name, :year_completed => land_year)
    @title = Title.create(:name => title_name)
    "#{@figure.name} #{@landmark.name} #{@landmark.year_completed} #{@title.name}"
    # redirect to "figures/#{@figure.id}"
  end
  
  get '/figures/new' do 
    erb :'figures/new'
  end
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
  
end


  # allows you to create a new figure with a title (FAILED - 2)
  # allows you to create a new figure with a landmark (FAILED - 3)
  # allows you to create a new figure with a new title (FAILED - 4)
  # allows you to create a new figure with a new landmark (FAILED - 5)