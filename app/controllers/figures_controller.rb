class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figures.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
   end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    #create a new figure
  end

  get 'figures/:id' do
    #find the post by id?
  end

end
