class FiguresController < ApplicationController

  get '/figures' do
       @figures = Figure.all
       erb :'figures/index'
     end

     get '/figures/new' do
       erb :'figures/new'
     end

     post '/figures' do
       binding.pry
       @figure = Figure.create(name: params["figure"]["name"])
       @figure.landmarks << Landmark.create(landmark: params["landmark"]["name"])
       @figure.title = Figure.create(title: params["title"]["name"])
       @figure.save
       end
end
