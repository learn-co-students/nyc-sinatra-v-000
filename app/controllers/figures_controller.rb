class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  
# {"figure"=>
#   {"name"=>"butter", 
#   "title_ids"=>["3"], 
#   "new_title"=>{"name"=>"senior"}, 
#   "landmark_ids"=>["2"], 
#   "new_landmark"=>
#     {
#       "name"=>"dogpark", "year"=>"2012"
#     }
#   }
# }
  
  
  post '/figures' do 
    
    fig_name = params[:figure][:name]
    @figure = Figure.create(:name => fig_name)
    
    land_ids = params[:figure][:landmark_ids]
    land_ids.each do |id|
      landmark = Landmark.find(id)
      @figure.landmarks << landmark
      # @landmark.figure = @figure
    end
    
    title_ids = params[:figure][:title_ids]
    title_ids.each do |id|
      title = Title.find(id)
      @figure.titles<< title
      # @title.figure = @figure
    end
    
    land_name = params[:figure][:new_landmark][:name]
    land_year = params[:figure][:new_landmark][:year]
    @figure.landmarks << Landmark.create(:name => land_name, :year_completed => land_year)
    
    
    title_name = params[:figure][:new_title][:name]
    @figure.title << Title.create(:name => title_name)
    
    # @figure.figure_titles.build(:title => @title)
    
    @figure.save
    
    # "#{@figure.name} #{@landmark.name} #{@landmark.year_completed} #{@title.name}"
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

