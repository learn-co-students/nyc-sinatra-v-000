class FiguresController < ApplicationController
  get '/new' do
    erb :'figures/new'
  end
end
