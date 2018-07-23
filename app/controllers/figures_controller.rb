class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures' do
    @figures = Figure.all
   erb :'figures/index'
   end


  post '/figures' do
      @figure = Figure.create(:name => params["figure"]["name"])
      if !params["title"]["name"].empty?
      @title = Title.create(:name => params["title"]["name"])
      @figure.title_id << @title.id
    else
     @figure.titles << Title.find_by(:name => params["title"]["name"])
    end
  @figure.save
    erb :'figures/show'
  end

end
