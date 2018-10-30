class FiguresController < ApplicationController
  # add controller methods

get '/figures' do
  erb :'figures/index'
end


get '/figures/new' do
  @figure = Figure.create(name: params[:name])
  erb :'figures/new'
  end

end
