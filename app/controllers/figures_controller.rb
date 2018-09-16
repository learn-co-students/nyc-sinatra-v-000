class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do

    erb :"/figures/new"
  end

  get '/figures' do
    @figures = Figure.all

    erb :"/figures/index"
  end

  get '/figures/:id' do
    @one_figure = Figure.find_by_id(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    @figure.name = params[:figure][:name]
    @figure.landmarks <<  Landmark.create(:name => params[:landmark][:name])

    @figure.save

    redirect to "/figures/#{@figure.id}"
    
  end


  post '/figures' do
    
    #store relevant param values to variables
    @name = params[:figure][:name]

    titles_id_array = params[:figure][:title_ids]
    @new_title = params[:title][:name]

    landmark_id_array = params[:figure][:landmark_ids]
    @new_landmark_name = params[:landmark][:name]
    @new_landmark_year_completed = params[:landmark][:year_completed].to_i    
    
    

    # if there is a name entered in the name field, then create a new figure
    if @name
      @new_figure = Figure.find_or_create_by(:name => @name)
      

      #### HANDLE TITLES #####

      # if there are existing title options checked, then find the existing title from databse and assign the checked titles to the newly created figure
      if !!titles_id_array
        titles_id_array.each do |id|
          @new_figure.titles << Title.find_by_id(id)
        end
      end
      
      # if new title field is NOT empty, create new title and assign title to new figure's titles array
      if @new_title
        @new_figure.titles << Title.new(:name => @new_title)
      end
      #### HANDLE LANDMARKS #####

      # if there are existing landmark options checked, then find the existing landmark from database and assign the checked landmarks to the newly created figure
      if landmark_id_array
        landmark_id_array.each do |id|
          @new_figure.landmarks << Landmark.find_by_id(id)
        end
      end

      
      # if new landmark fields are NOT empty, create new landmark and assign landmark to new figure's landmark array
      if @new_landmark_name
        
        @new_figure.landmarks << Landmark.new(:name => @new_landmark_name)
        if @new_landmark_year_completed
          @new_figure.landmarks.last.year_completed = @new_landmark_year_completed
        end
      end
      
      ### SAVE EVERYTHING ABOVE TO DATABASE ###
      @new_figure.save
      
    end
  end

end
