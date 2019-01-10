class FiguresController < ApplicationController
  # use Rack::Flash
  
  get '/figures' do
    @figures = Figure.all 
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end


  post '/figures' do
    @figure = Figure.create(:name => params["figure"]["name"])
    @figure.titles <<  Title.find_or_create_by(:name => params[:figure][:title_ids])

    if params[:figure][:landmark_ids] != nil
      obj = Landmark.find_by(id: params[:figure][:landmark_ids]) || Landmark.create(id: params[:figure][:landmark_ids])
      @figure.landmarks << obj
    end

    @figure.landmarks << Landmark.find_or_create_by(params["landmark"])
    @figure.save
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.landmarks <<  Landmark.find_or_create_by(name: params[:landmark][:name])
    redirect "figures/#{@figure.id}"
  end
  
end
