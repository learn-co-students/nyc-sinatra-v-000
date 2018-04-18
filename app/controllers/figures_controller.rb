class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      @title = Title.find_or_create_by(:name => params["title"]["name"])
      @figure.titles << @title
   end
    #@figure.title_ids << params["figure"]["title_ids"]
    #@figure.landmark_ids = params["figure"]["landmark_ids"]
  end
end
