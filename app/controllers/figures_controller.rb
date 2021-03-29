require 'pry'
class FiguresController < ApplicationController
  # add controller methods
  
  get '/figures' do #index
  @figures = Figure.all
  erb :"/figures/index"
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    @title = Title.find_by(:name => params[:title][:name])
    @landmark = Landmark.find_by(:name => params[:landmark][:name])
    @title_ids = params[:figure][:title_ids]
    @landmark_ids = params[:figure][:landmark_ids]

    if @title == nil #existing artist not found
      t = Title.create(:name => params[:title][:name])
      @figure.titles << t
    end

    if @title_ids
      @title_ids.each do |id|
        t = Title.find(id)
        @figure.titles << t
      end
    end

    if @landmark == nil #existing landmark not found
      l = Landmark.create(:name => params[:landmark][:name])
      @figure.landmarks << l
    end

    if @landmark_ids
      @landmark_ids.each do |id|
        l = Landmark.find(id)
        @figure.landmarks << l
      end
    end

      @figure.save
      redirect to "/figures/#{@figure.id}"
  end
  
  get '/figures/new' do #create
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end
  
  get '/figures/:id' do #show
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    if @title_ids
      @figure.titles.clear
      @title_ids.each do |id|
        t = Title.find(id)
        @figure.titles << t
      end
    end
    if !@title[:name].empty?
      t = Title.create(:name => @title[:name])
      @figure.titles << t
    end
    if @landmark_ids
      @figure.landmarks.clear
      @landmark_ids.each do |id|
        l = Landmark.find(id)
        @figure.landmarks << l
      end
    end
    if !@landmark[:name].empty?
      l = Landmark.create(:name => @landmark[:name])
      @figure.landmarks << l
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
    #existing 
    #{"_method"=>"PATCH", "figure"=>{"name"=>"Linus Torvalds", 
    #"title_ids"=>["1", "2", "3"], "title"=>{"name"=>""}, 
    #"landmark_ids"=>["2", "3", "4"], "landmark"=>{"name"=>""}}, "id"=>"4

    #new
    #{"_method"=>"PATCH", "figure"=>{"name"=>"Linus Torvalds", 
    #"title"=>{"name"=>"Top Dancer"}, "landmark"=>{"name"=>"Studio 54"}},