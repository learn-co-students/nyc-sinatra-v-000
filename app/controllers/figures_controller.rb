class FiguresController < ApplicationController

    get '/figures' do
        @figures = Figure.all
        erb :'figures/index'
    end

    get '/figures/new' do
        @titles = Title.all
        @landmarks = Landmark.all
        erb :'figures/new'
    end

    post '/figures' do
        @figure = Figure.find_by(:name => params['figure']['name'])
        if @figure == nil
            @figure = Figure.create(:name => params['figure']['name'])
        end
        if params['title']['name'] != ""
             @title = Title.create(:name => params['title']['name'])
             @figure.titles << @title
         end

        if params['figure']['title_ids'] != nil
            @titles = Title.find(params['figure']['title_ids'])
            @figure.titles << @titles
        end
        # binding.pry
        if params['landmark']['name'] != ""
            @landmark = Landmark.create(:name => params['landmark']['name'])
            @figure.landmarks << @landmark
        end

        # binding.pry
        if params['figure']['landmark_ids'] != nil
            @landmarks = Landmark.find(params['figure']['landmark_ids'])
            @figure.landmarks << @landmarks
        end
        # binding.pry
        @figure.save
        redirect to "figures/#{@figure.id}"
    end

    get '/figures/:id' do
        # binding.pry
        @figure = Figure.find(params[:id])
        erb :'figures/show'
    end

    get '/figures/:id/edit' do
        @titles = Title.all
        @figure = Figure.find(params[:id])

        erb :"figures/edit"
    end

    post '/figures/:id/edit' do
        binding.pry
        @titles = Title.all
        @figure = Figure.find(params[:id])

        redirect to "figures/#{@figure.id}"
    end


end
