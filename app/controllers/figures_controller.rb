class FiguresController < ApplicationController

    get '/figures' do # list all figures
        @figures = Figure.all
        erb :'figures/index'
    end

    get '/figures/new' do # view form to create a figure
        erb :'figures/new'
    end

    get '/figures/:id' do # see individual figure
        @figure = Figure.find(params[:id])
        erb :'/figures/show'
    end

    get '/figures/:id/edit' do # edit a figure
        @figure = Figure.find(params[:id])
        erb :'/figures/edit'
    end

    post '/figures' do # submit the form
        @figure = Figure.create(params[:figure])

        if !params[:landmark][:name].empty?
            @figure.landmarks << Landmark.create(params[:landmark])
        end

        if !params[:title][:name].empty?
            @figure.titles << Title.create(params[:title])
        end

        @figure.save
        redirect to "/figures/#{@figure.id}"
    end

end