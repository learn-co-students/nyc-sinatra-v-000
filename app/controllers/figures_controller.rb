class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end


  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @showfigure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    newlandmark = Landmark.find_or_create_by(params[:landmark])
    if newlandmark
      @figure.landmarks << newlandmark
    end
    @figure.landmark_ids << params[:landmarks]

    newtitle = Title.find_or_create_by(params[:title])
    if newtitle
      @figure.titles << newtitle
    end
    @figure.title_ids << params[:titles]

    @figure.save

    redirect to "/figures/#{@figure.id}"
 
  end


  get '/figures/:id/edit' do
    @editfigure = Figure.find_by(id: params[:id])
    erb :'/figures/edit'
    #binding.pry
  end
  
  patch '/figures/:id' do
    @updatedfigure = Figure.find_by(id: params[:id])
    @updatedfigure.update(name: params[:figure][:name])
    @updatedfigure.landmark_ids = params[:figure][:landmark_ids]
    if !params[:new_landmark].empty?
      newlandmark = Landmark.create(params[:landmark])
      @updatedfigure.landmarks << newlandmark
    end

    @updatedfigure.title_ids = params[:figure][:title_ids]
    @updatedfigure.save
    

    redirect to "/figures/#{@updatedfigure.id}"

  end




  
end
