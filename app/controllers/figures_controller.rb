class FiguresController < ApplicationController

  get '/figures' do
    binding.pry
    erb :index
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do

  end

end
