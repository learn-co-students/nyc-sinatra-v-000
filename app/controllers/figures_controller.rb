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
        #@figure = Figure.create(name: params[:figure][:name])
        #@figure.landmark = Landmark.find_or_create_by(name: params[:figure][:landmark])
        #@figure.title = Title.create(name: params[:figure][:title])
        #@figure.save

        redirect to ("/figures/#{@figure.slug}")
    end

# SHOW - find a particular figure and display it.
    get '/figures/:slug' do
        @figure = Figure.find_by_slug(params[:slug])
        erb :'/figures/show'
    end

    patch '/figures/:slug' do
        #@figure = Figure.find_by_slug(params[:slug])
        #@figure.name = params[:figure][:name]
        #@figure.title = Title.find_or_create_by(name: params[:figure][:title])
        ##@figure.
        #@figure.landmark = Landmark.find_or_create_by(name: params[:figure][:landmark])
        #@figure.save
        redirect to ("/figures/#{@figure.slug}")
    end

    get '/figures/:slug/edit' do
        @figure = Figure.find_by_slug(params[:slug])
        erb :'/figures/edit'
    end
end
