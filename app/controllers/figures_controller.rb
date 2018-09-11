class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    erb :new
  end

end
