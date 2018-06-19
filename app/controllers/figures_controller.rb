class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @figure.titles << Title.find_or_create_by(id: params[:figure][:title_ids])

    #@figure.landmarks << Landmark.find_or_create_by()
    erb :'/figures/show'
  end
end
