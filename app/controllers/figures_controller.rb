class FiguresController < ApplicationController

  get '/figures' do
    erb :index
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  post '/figures' do
     binding.pry
  end

end
