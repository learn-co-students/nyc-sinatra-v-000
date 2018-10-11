class FiguresController < ApplicationController
  register Sinatra::Flash

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    @landmarks = Landmark.all
    @titles = Title.all

    #checking for duplicate titles
    if !params["title"]["title_id"].nil?
      @title_dup_check = @titles.any?{|title| title.name == (Title.find(params["title"]["title_id"].to_i)).name}
    else  
      @title_dup_check = @titles.any?{|title| begin title.name == (Title.find_by(name: params["title"]["name"])).name rescue next end}
    end

    #checking whether or not a new title should be created or assigned
    if params["title"]["name"].empty? && !@title_dup_check
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
      @figure.save
    elsif params["title"]["name"].empty? && @title_dup_check
      @figure.titles << Title.find(params["title"]["title_id"].to_i)
      @figure.save
    elsif !params["title"]["name"].empty? && !@title_dup_check
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
      @figure.save
    end

    #checking for duplicate landmarks
    if !params["landmark"]["landmark_id"].nil?
      @landmark_dup_check = @landmarks.any?{|landmark| landmark.name == (Landmark.find(params["landmark"]["landmark_id"].to_i)).name}
    else  
      @landmark_dup_check = @landmarks.any?{|landmark| begin landmark.name == (Landmark.find_by(name: params["landmark"]["name"])).name rescue next end}
    end

    #checking whether or not a new landmark should be created or assigned
    if params["landmark"]["name"].empty? && !@landmark_dup_check
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @landmark.figure = @figure
      @landmark.save
    elsif params["landmark"]["name"].empty? && @landmark_dup_check
      @landmark = Landmark.find(params["landmark"]["landmark_id"])
      @landmark.figure = @figure
      @figure.save
    elsif !params["landmark"]["name"].empty? && !@landmark_dup_check
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @landmark.figure = @figure
      @landmark.save
    end
  
    redirect "/figures/#{@figure.id}"
  end

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])

    @landmarks = Landmark.all
    @titles = Title.all
    
    #checking for duplicate titles
    if !params["figure"]["title_ids"].nil?
      # @title_dup_check = @titles.any?{|title| title.name == (Title.find(params["figure"]["title_ids"].to_i)).name}
      @title_dup_check = params["figure"]["title_ids"].any? { |id| begin  id.to_i == Title.find(id).id.to_i rescue next end}
    else  
      @title_dup_check = @titles.any?{|title| begin title.name == (Title.find_by(name: params["title"]["name"])).name rescue next end}
    end

    #checking whether or not a new title should be created or assigned
    if params["title"]["name"].empty? && !@title_dup_check
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
      @figure.save
    elsif params["title"]["name"].empty? && @title_dup_check
      @figure.titles << Title.find(params["title"]["title_id"].to_i)
      @figure.save
    elsif !params["title"]["name"].empty? && !@title_dup_check
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
      @figure.save
    end

    #checking for duplicate landmarks
    if !params["landmark"]["landmark_id"].nil?
      # @landmark_dup_check = @landmarks.any?{|landmark| landmark.name == (Landmark.find(params["landmark"]["landmark_id"].to_i)).name}
      @landmark_dup_check = params["figure"]["landmark_ids"].any? { |id| begin  id.to_i == Landmark.find(id).id.to_i rescue next end}
    else  
      @landmark_dup_check = @landmarks.any?{|landmark| begin landmark.name == (Landmark.find_by(name: params["landmark"]["name"])).name rescue next end}
    end

    #checking whether or not a new landmark should be created or assigned
    if params["landmark"]["name"].empty? && !@landmark_dup_check
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @landmark.figure = @figure
      @landmark.save
    elsif params["landmark"]["name"].empty? && @landmark_dup_check
      @landmark = Landmark.find(params["landmark"]["landmark_id"])
      @landmark.figure = @figure
      @figure.save
    elsif !params["landmark"]["name"].empty? && !@landmark_dup_check
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @landmark.figure = @figure
      @landmark.save
    end
  
    flash[:message] = "Successfully updated figure." 

    redirect "/figures/#{@figure.id}"
  end
end
