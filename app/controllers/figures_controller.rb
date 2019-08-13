class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do

    erb :'/figures/index'
  end

  get '/figures/new' do
    # @titles = Title.all
    # @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    # create a new figure
    # binding.pry
    @figure = Figure.create(params['figure'])
    # with existing title
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    # with new title

    # with existing landmark
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    # with new landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    erb :'figures/show'
  end
end
