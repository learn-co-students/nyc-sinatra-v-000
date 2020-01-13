class FiguresController < ApplicationController
  get '/figures' do 
    @figures = Figure.all
    erb :"/figures/index"
  end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"/figures/new"
  end
  
  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    #binding.pry
    if params["figure"]["title_ids"] != ""
      params["figure"]["title_ids"].each do |item|
        @title = Title.find(item)
        @figure.titles << @title
      end
    elsif params["title"]["name"] != ""
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title.id
    else 
      @figure.save 
    end
    if !!params["landmark"]["name"].scan(/\w/) != ""
      @landmark = Landmark.create(name: params["landmark"]["name"], figure_id: @figure.id)
      elsif params["figure"]["landmark_ids"].count > 0 
      params["figure"]["landmark_ids"].each do |item|
        @landmark = Landmark.find(item)
        @landmark.figure_id << @figure.id
      end
    else 
      @figure.save
      end
    end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/edit'
  end
  
  patch '/figures/:id' do
    binding.pry
    a = {}
    @figure = Figure.find(params[:id])
    @landmark = Landmark.find_by(figure_id: params[:id])
    if @figure.name != params["figure"]["name"]
      a[:name] = params["figure"]["name"]
      @figure.update(a)
    end
    b = {}
    if params[:figure].keys.include?("title_ids")
      b[:title_ids] = params["figure"]["title_ids"]
      @figure.update(b)
    end
    if params["figure"]["title"] != ""
      @figure.titles << Title.new(name: params["figure"]["title"])
    end
    c = {}
    if @landmark.name != params["landmark"]["name"]
      c[:name] = params["landmark"]["name"]
      @landmark.update(c)
    end
    d = {}
    if params[:figure].keys.include?("landmark_ids")
      b[:title_ids] = params["figure"]["title_ids"]
      @figure.update(b)
    end
      
  end
end
    
    


    
    
    
    
    
 
