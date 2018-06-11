class FiguresController < ApplicationController
    get '/figures' do
        @figures = Figure.all

        erb :'/figures/index'
    end

    get '/figures/new' do
        @titles = Title.all
        @landmarks = Landmark.all

        erb :'/figures/new'
    end

    get '/figures/:id' do
        @figure = Figure.find(params[:id])

        erb :'/figures/show'
    end

    post '/figures' do
        titles = []
        if params[:figure][:title_ids]
            titles = params[:figure][:title_ids].collect do |t_id|
                Title.find(t_id)
            end
        end
        if params[:title][:name]
            titles << Title.find_or_create_by(name: params[:title][:name])
        end

        landmarks = []
        if params[:figure][:landmark_ids]
            landmarks = params[:figure][:landmark_ids].collect do |lm_id|
                Landmark.find(lm_id)
            end
        end
        if params[:landmark][:name]
            landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
        end

        figure = Figure.new
        figure.name = params[:figure][:name]
        figure.titles = titles
        figure.landmarks = landmarks

        figure.save

        redirect "/figures/#{figure.id}"
    end
end