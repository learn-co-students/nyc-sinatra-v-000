class FiguresController < ApplicationController
    get '/figures' do
      @figures = Figure.all
      erb :'/figures/index'
    end
    
    post '/figures' do
        @figure = Figure.find_or_create_by(name: params[:figure][:name])
        
        if params[:figure][:title_ids] != nil
          params[:figure][:title_ids].each { |title_id|
            @figure.titles << Title.find(title_id)
          }
        end
        
        if params[:figure][:landmark_ids] != nil
          params[:figure][:landmark_ids].each { |landmark_id|
            @figure.landmarks << Landmark.find(landmark_id)
          }
        end
        
        if !params[:title][:name].empty?
          @figure.titles << Title.find_or_create_by(name: params[:title][:name])
        end

        if !params[:landmark][:name].empty?
          @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
        end
    end
    
    get '/figures/new' do
       erb :'/figures/new' 
    end
    
    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'/figures/show'
    end
    
    get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])
        erb :'/figures/edit'
    end
    
    patch '/figures/:id' do
        @figure = Figure.find(params[:id])
        @figure.update(name: params[:figure][:name])
        if params[:figure][:title_ids] != nil
          params[:figure][:title_ids].each { |title_id|
            @figure.titles << Title.find(title_id)
          }
        end
        
        if params[:figure][:landmark_ids] != nil
          params[:figure][:landmark_ids].each { |landmark_id|
            @figure.landmarks << Landmark.find(landmark_id)
          }
        end
        
        if !params[:title][:name].empty?
          @figure.titles << Title.find_or_create_by(name: params[:title][:name])
        end

        if !params[:landmark][:name].empty?
          @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
        end
                # binding.pry
        @figure.save

        erb :'/figures/show'
    end
end
