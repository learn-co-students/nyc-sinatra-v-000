class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/application/figures/new'
  end

end
