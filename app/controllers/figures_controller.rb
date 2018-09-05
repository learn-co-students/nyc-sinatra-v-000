class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
     erb :'figures/new'
  end

  post '/figures' do
     @figure = Figure.create(params[:figure])
     if params[:title][:name].length > 0
        @figure.titles << Title.create(params[:title])
     end
     if params[:landmark].values.any? { |e|  e.length > 0}
        @figure.landmarks << Landmark.create(params[:landmark])
     end
     redirect "/figures/#{@figure.id}"
  end

  get '/figures' do
     erb :'figures/index'
  end

  get '/figures/:id' do
     @figure = Figure.find(params[:id])
     erb :'figures/show'
  end

  get '/figures/:id/edit' do
     # binding.pry
     @figure = Figure.find(params[:id])
     erb :'figures/edit'
  end

  patch '/figures/:id' do
     # binding.pry
     @figure = Figure.find(params[:id])
     @figure.update(params[:figure])
     if params[:title][:name].length > 0
        @figure.titles = []
        @figure.titles << Title.create(params[:title])
     end
     if params[:landmark].values.any? { |e|  e.length > 0}
        @figure.landmarks = []
        @figure.landmarks << Landmark.create(params[:landmark])
     end
     redirect "/figures/#{@figure.id}"
  end
end
