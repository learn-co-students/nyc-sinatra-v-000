class FiguresController < ApplicationController

  get '/figures' do
      @figures = Figure.all
      erb :'figures/index'
    end

  get '/figures/new' do

    erb :'figures/new'
  end

  get '/figures/:id' do
  #  binding.pry
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end


  post '/figures' do
    puts params
#binding.pry
    @figure = Figure.create(params["figure"])
#binding.pry
    if !params["title"]["name"].empty?
    @title = Title.create(params[:title])
    @figure.titles << @title
    end

    if  !params["figure"]["name"].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end

    @figure.save
  end

  patch '/figures/:id' do
    puts params
   @figure = Figure.find(params[:id])
   @figure.update(name: params[:figure][:name])
   if !params[:figure][:title_ids].empty?
     @title = Title.create(name: params[:figure][:title_ids])
     @figure.titles << @title
   end
   if !params[:figure][:landmark_ids].empty?
   @landmark = Landmark.create(name: params[:figure][:landmark_ids])
   @figure.landmarks << @landmark
  end
   @figure.save
   redirect "figures/#{@figure.id}"
  end

end
