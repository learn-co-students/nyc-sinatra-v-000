require 'pry'

class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    # raise params.inspect
    # {"figure"=>{"name"=>"New Figure", "title_ids"=>["2"], "landmark_ids"=>["9"]}, "title"=>{"name"=>""}, "landmark"=>{"name"=>""}

    @figure = Figure.new(params["figure"])

    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params["title"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    binding.pry
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

end
