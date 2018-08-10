class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures/new' do
    @fig = Figure.new(name: params[:fig][:name])
    if !!params[:fig][:titles]
      params[:fig][:titles].each do |id|
        @title = Title.find(id)
        @fig.titles << @title
      end
    end
    if params[:title][:name] != ""
      @title2 = Title.new(name: params[:title][:name])
      @fig.titles << @title2
    end
    if !!params[:fig][:land]
      params[:fig][:land].each do |id|
        @land = Landmark.find(id)
        @fig.landmarks << @land
      end
    end
    if params[:land][:name] != ""
      @land2 = Landmark.new(name: params[:land][:name])
      @fig.landmarks << @land2
    end
    @fig.save
    redirect "/figures/#{@fig.id}"
  end

  get '/figures/:id' do
    @fig = Figure.find(params[:id])
    erb :'/figures/show'
  end
end
