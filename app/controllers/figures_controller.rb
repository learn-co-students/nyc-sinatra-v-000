class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  post '/figures' do 
    name = params[:figure][:name]
    @figure = Figure.create(:name => name)
    redirect to "figures/#{@figure.id}"
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