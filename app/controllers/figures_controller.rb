class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    erb :'figures/show'
  end
end
