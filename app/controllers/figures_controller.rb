class FiguresController < ApplicationController
  
  get '/figures' do 
    
    erb :'/figures/index' 
  end
  
  get '/figures/new' do 
    
    erb :'/figures/new' 
  end
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id]) 
    
    erb :'/figures/show'
  end
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    
    if !params["title"]["name"].empty?
      title = Title.create(params[:title])
      @figure.titles << title 
    end
    
    # if params[:figure].keys.include?("title_ids")
    #   params["figure"]["title_ids"].each do |title_id|
    #     title = Title.find_by_id(title_id)
    #     @figure.titles << title 
    #   end
    # end
    
    # if params[:figure].keys.include?("landmark_ids")
    #   params["figure"]["landmark_ids"].each do |landmark_id|
    #     landmark = Landmark.find_by_id(landmark_id)
    #     @figure.landmarks << landmark 
    #   end
    # end
    
    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark 
      
    end
   
    @figure.save 
    redirect "/figures/#{@figure.id}"
  end
  
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id]) 
    erb :'/figures/edit' 
  end
  
  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    
    @figure.update(params[:figure])
    
    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title 
    end
    
    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(:name => params[:landmark][:name])
      
      if !params[:landmark][:year_completed].empty?
        landmark.year_completed = params[:landmark][:year_completed]
      end 
      
      @figure.landmarks << landmark 
    end
     
    @figure.save 
    redirect "/figures/#{@figure.id}" 
     
  end
end
