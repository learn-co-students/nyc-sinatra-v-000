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
    
    # "#{@figure.name} #{@figure.landmarks.first.name} #{@figure.titles.first.name}"
    
    
    land_name = params[:landmark][:name]
    land_year = params[:landmark][:year]
    @figure.landmarks << Landmark.create(:name => land_name, :year_completed => land_year)
    

    title_name = params[:title][:name]
    @figure.title << Title.create(:name => title_name)
    
    "#{@figure.name} #{@figure.landmarks.first.name} #{@figure.landmarks.first.year_completed} #{@figure.titles.first}"
    
    # # @figure.figure_titles.build(:title => @title)
    
    # @figure.save
    
    # redirect to "figures/#{@figure.id}"
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
  
end

