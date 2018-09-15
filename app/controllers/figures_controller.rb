class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(:name => params["figure"]["name"], :title_ids => params["figure"]["title_ids"], :landmark_ids => params["figure"]["landmark_ids"])
    #binding.pry
    if params["title"]["name"] == ""
      @figure.titles << Title.find(params["figure"]["title_ids"])
    else
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    @figure.save
    redirect '/figures'
  end
  
  get '/figures' do
    @figures = Figure.all
    
  end
end
