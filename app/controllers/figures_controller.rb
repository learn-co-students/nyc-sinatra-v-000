class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end
  
 
  post '/figures' do 
    # raise params.inspect
    fig_name = params[:figure][:name]
    @figure = Figure.create(:name => fig_name)

    land_ids = params[:figure][:landmark_ids]
    if land_ids
      land_ids.each do |id|
        landmark = Landmark.find(id)
        @figure.landmarks << landmark
        # @landmark.figure = @figure
      end
    end
    
    title_ids = params[:figure][:title_ids]
    if title_ids
      title_ids.each do |id|
        title = Title.find(id)
        @figure.titles<< title
        # @title.figure = @figure
      end
    end
    
    land_name = params[:landmark][:name]
    land_year = params[:landmark][:year]
    @figure.landmarks << Landmark.create(:name => land_name, :year_completed => land_year)
    
    title_name = params[:title][:name]
    @figure.titles << Title.create(:name => title_name)
    
    "#{@figure.name} #{@figure.landmarks.first.name} #{@figure.landmarks.first.year_completed} #{@figure.titles.first}"

    redirect to "figures/#{@figure.id}"
  end
  
  
  get '/figures/new' do 
    @figures = Figure.all
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
  
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end
  


{"_method"=>"PATCH", 

"figure"=>
    {
    "name"=>"The Kid", "title_ids"=>["1"], "landmark_ids"=>["6"]
    }, 
    
"title"=>
    {"name"=>"queen"}, 
    
"landmark"=>
    {"name"=>"school", "year"=>"1995"}, 
    
"id"=>"1"}

  
  patch '/figures/:id' do 
    # raise params.inspect
    @figure = Figure.find(params[:id])
    new_name = params[:figure][:name]
    if new_name 
      @figure.name = new_name 
    end
    
    new_landmark_name = params[:landmark][:name]
    new_landmark_year = params[:landmark][:year]
    new_landmark = Landmark.create(:name => new_landmark_name, :year_completed => new_landmark_year)
    new_title = Title.create(:name => params[:title][:name])

    land_ids = params[:figure][:landmark_ids]
    if land_ids
      land_ids.each do |id|
        landmark = Landmark.find(id)
        @figure.landmarks.clear
        @figure.landmarks << landmark
      end
    end
    
    title_ids = params[:figure][:title_ids]
    if title_ids
      title_ids.each do |id|
        title = Title.find(id)
        @figure.titles.clear
        @figure.titles << title
      end
    end

    @figure.landmarks << new_landmark
    @figure.titles << new_title
    
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
  
  
  
  
end

