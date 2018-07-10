class FiguresController < ApplicationController

  get '/figures' do
      erb :'/figures/index'
  end

  get '/figures/new' do
      erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    if !params["title"]["name"].empty?
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end
    @title_ids = params["figure"]["title_ids"]
    @title_ids.each {|id| @figure.titles << Title.find_by_id(id)} unless @title_ids.nil?
    if !params["landmark"]["name"].empty?
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @landmark.year_completed = params["landmark"]["year_completed"] unless nil?
      @landmark.save
      @figure.landmarks << @landmark
    end
    @landmark_ids = params["figure"]["landmark_ids"]
    @landmark_ids.each {|id| @figure.landmarks << Landmark.find_by_id(id)} unless @landmark_ids.nil?
    @figure.save

    "Successfully Created New Figure"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params["id"])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params["id"])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params["id"])
    @figure.name = params["figure"]["name"]
    if !params["title"]["name"].empty?
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end
    @title_ids = params["figure"]["title_ids"]
    @title_ids.each {|id| @figure.titles << Title.find_by_id(id)} unless @title_ids.nil?
    if !params["landmark"]["name"].empty?
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @landmark.year_completed = params["landmark"]["year_completed"] unless nil?
      @landmark.save
      @figure.landmarks << @landmark
    end
    @landmark_ids = params["figure"]["landmark_ids"]
    @landmark_ids.each {|id| @figure.landmarks << Landmark.find_by_id(id)} unless @landmark_ids.nil?
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
