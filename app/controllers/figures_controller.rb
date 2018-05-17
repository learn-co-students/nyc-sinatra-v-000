class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @title_array = []
    @landmark_array = []

    if params["figure"]["title_ids"] != nil
      params["figure"]["title_ids"].each do |title_id|
        title = Title.find_by(title_id)
        @title_array << title
      end
    end
    if params["title"]["name"] != ""
      title = Title.create(name: params["title"]["name"])
      @title_array << title
    end

    if params["figure"]["landmark_ids"] != nil
      params["figure"]["landmark_ids"].each do |landmark_id|
        landmark = Landmark.find_by(landmark_id)
        @landmark_array << landmark
      end
    end
    if params["landmark"]["name"] != ""
      landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"])
      @landmark_array << landmark
    end

    @figure = Figure.create(name: params["figure"]["name"])
    @figure.titles << @title_array
    @figure.landmarks << @landmark_array
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    #binding.pry
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])

    @figure.name = params["figure"]["name"]

    @title_array = []
    @landmark_array = []

    if params["figure"]["title_ids"] != nil
      params["figure"]["title_ids"].each do |title_id|
        title = Title.find_by(title_id)
        @title_array << title
      end
    end
    if params["title"]["name"] != ""
      title = Title.create(name: params["title"]["name"])
      @title_array << title
    end

    if params["figure"]["landmark_ids"] != nil
      params["figure"]["landmark_ids"].each do |landmark_id|
        landmark = Landmark.find_by(landmark_id)
        @landmark_array << landmark
      end
    end
    if params["landmark"]["name"] != ""
      landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"])
      @landmark_array << landmark
    end

    @figure.titles.clear
    @figure.titles << @title_array
    @figure.landmarks.clear
    @figure.landmarks << @landmark_array
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end
