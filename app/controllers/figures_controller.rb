class FiguresController < ApplicationController
  # add controller methods

  
  get '/figures' do
    
    erb :"/figures/index"
  end
  
  
  get '/figures/new' do
  
    erb :"/figures/new"
  end
  

  post '/figures' do
    # binding.pry
    @figure = Figure.create(name: params[:figure][:name])
    
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed], figure_id: @figure.id)
      # @figure.landmarks << Figure.update(name: params[:landmark][:name])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
   
    # @figure.landmarks << Figure.update(name: params[:landmark_ids])
    @figure.save
       
  end

end







