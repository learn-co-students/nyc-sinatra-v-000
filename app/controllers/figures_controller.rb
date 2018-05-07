class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    puts params

    @figure = Figure.create(name: params["figure"]["name"])
    @title = Title.create(name: params["title"]["name"])
    binding.pry
  end
end
