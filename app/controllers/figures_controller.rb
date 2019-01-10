class FiguresController < ApplicationController
  
  get '/figures' do #lists all figures
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do #renders form to create new figure
    erb :'figures/new'
  end

end
