class FiguresController < ApplicationController

# INDEX -
    get '/figures' do
        @figures = Figure.all
        erb :'/figures/index'
    end
# NEW -
    get '/figures/new' do
        #@landmarks = Landmark.all
        erb :'/figures/new'
    end
#POST - create a new figure instance
    post '/figures' do
        @figure = Figure.create(params[:figure])
        @figure.landmarks <<  Landmark.create(params[:landmark]) unless params[:landmark][:name].empty?
        @figure.titles << Title.create(params[:title]) unless params[:title][:name].empty?
        @figure.save

        redirect to ("/figures/#{@figure.id}")
    end

# SHOW - find a particular figure and display it.
    get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :'/figures/show'
    end

    patch '/figures/:id' do
        @figure = Figure.find(params[:id])
        @figure.update(name: params[:figure][:name])
        @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].blank?
        @figure.titles << Title.create(params[:title]) unless params[:title][:name].blank?

        @figure.save

        redirect to ("/figures/#{figure.id}")
    end

    get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])
        erb :'figures/edit'
    end
end
