class FiguresController < ApplicationController
  # add controller methods	
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end
   get '/figures/new' do
    #binding.pry
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end
   get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end
   post '/figures' do
    #@figure = Figure.create(:name => params[:figure][:name])
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles.new(params[:title])
    end
    if !params[:landmark].empty? 
      @figure.landmarks.new(params[:landmark])
    end
    @figure.save
    redirect to "figures"
  end
   get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
   patch '/figures/:id' do
    if figure = Figure.find_by_id(params[:id])
      if !params[:figure].keys.include?(:title_ids)
        params[:figure][:title_ids] = []
      end
      if !params[:figure].keys.include?(:landmark_ids)
        params[:figure][:landmark_ids] = []
      end
      figure.update(params[:figure])
      
      if !params[:title][:name].empty?
        figure.titles.create(params[:title])
      end
      if !params[:landmark][:name].empty?
        figure.landmarks.create(params[:landmark])
      end
      figure.save
    end
    redirect to "/figures/#{figure.id}"
  end
 end	

