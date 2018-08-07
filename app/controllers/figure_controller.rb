class FiguresController < ApplicationController

    get '/figures' do
        @figures = Figure.all
        erb :'figures/index'
    end

    get '/figures/new' do  
        @landmarks = Landmark.all  
        @titles = Title.all
        erb :'/figures/new'
    end

    post '/figures' do    
        @figure = Figure.create(params[:figure])
        if !params[:title][:name].empty?
            @figure.titles << Title.create(params[:title])
        end
        if !params[:landmark][:name].empty?
            @figure.landmarks << Landmark.create(params[:landmark])
        end
        @figure.save
        redirect to "/figures"
    end

    get '/figures/:id' do
        @figure = Figure.find_by_id(params[:id])
        erb :'/figures/show'
    end
    
    patch '/figures/:id' do 
        figure = Figure.find_by_id(params[:id])
        figure.name = params[:figure][:name]
        
        if params[:figure][:title_ids]
            titles = params[:figure][:title_ids]
            titles.each do |title|
                figure.titles << Title.find(title)
            end
        end
        if params[:figure][:landmark_ids]
            landmarks = params[:figure][:landmark_ids]
            landmarks.each do |landmark|
                figure.landmarks << Landmark.find(landmark)
            end
        end
        if !params[:landmark][:name].empty?
            landmark = Landmark.create(params[:landmark])
            figure.landmarks << landmark
        end
        figure.save
        redirect to "/figures/#{figure.id}"
    end

    get '/figures/:id/edit' do   
        @figure = Figure.find_by_id(params[:id])
        @titles = Title.all
        @landmarks = Landmark.all
        erb :'/figures/edit'
    end
end
