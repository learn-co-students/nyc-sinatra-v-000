class FiguresController < ApplicationController

  get '/figures' do
    @all_fig = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @all_title = Title.all
    @all_land = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @fig = Figure.create(params["figure"])
    #binding.pry
    if !params["title"]["name"].empty?
      @fig.titles << Title.find_or_create_by(name: params["title"]["name"])
    end

    #if params["figure"]["title_ids"]
    #  if !params["figure"]["title_ids"].empty?
    #    params["figure"]["title_ids"].each do |title|
    #      @fig.titles << Title.find_by(title)
    #    end
    #  end
    #end

    #fig_lands = []
    if !params["landmark"]["name"].empty?
      @fig.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    end

    #if params["figure"]["landmark_ids"]
    #  if !params["figure"]["landmark_ids"].empty?
    #    params["figure"]["landmark_ids"].each do |land|
    #      fig_lands << Landmark.find_by(land)
    #    end
    #  end
    #end

    #binding.pry
    #if !fig_lands.empty?
    #  @fig.landmarks = fig_lands
    #end
    @fig.save
    redirect "/figures/#{@fig.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    @all_title = Title.all
    @all_land = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @fig = Figure.find_by(params[:id])
    @fig.update(params["figure"])
    #binding.pry
    if !params["title"]["name"].empty?
      @fig.titles << Title.find_or_create_by(name: params["title"]["name"])
    end

    #if params["figure"]["title_ids"]
    #  if !params["figure"]["title_ids"].empty?
    #    params["figure"]["title_ids"].each do |title|
    #      @fig.titles << Title.find_by(title)
    #    end
    #  end
    #end

    #fig_lands = []
    if !params["landmark"]["name"].empty?
      @fig.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    end

    #if params["figure"]["landmark_ids"]
    #  if !params["figure"]["landmark_ids"].empty?
    #    params["figure"]["landmark_ids"].each do |land|
    #      fig_lands << Landmark.find_by(land)
    #    end
    #  end
    #end

    #binding.pry
    #if !fig_lands.empty?
    #  @fig.landmarks = fig_lands
    #end
    @fig.save
    redirect "/figures/#{params[:id]}"
  end
end
