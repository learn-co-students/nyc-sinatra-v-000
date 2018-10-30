class FiguresController < ApplicationController
  # add controller methods

get '/figures' do
  
  erb :'figures/index'
end


get '/figures/new' do
  @figures = Figure.all

  erb :'figures/new'
  end

  post '/figures' do
    @title = Title.create(params[:title])
    @landmark = Landmark.create(params[:landmark])
  end

end
