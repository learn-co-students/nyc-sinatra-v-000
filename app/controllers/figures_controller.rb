class FiguresController < ApplicationController


    get '/figures/new' do
      @titles = Title.all
      @landmarks = Landmark.all
      @all_figures = Figure.all

      erb :'figures/new'
    end

    post '/figures' do

      title = Title.find_by(id: params["figure"]["title_ids"])
      figure = Figure.find_or_create_by(name: params["figure_name"])

      figure.titles << title

      landmark_params = params["landmark"]

      if !landmark_params.empty?
          landmark = Landmark.create(params["landmark"])
          figure.landmarks << landmark
      end
      figure.save


      redirect "/figures/#{figure.id}" #moves to route GET '/figures/name'
    end

    get '/figures/:id' do

      @figure = Figure.find_by_slug(params["slug"])
      erb :'figures/show'
    end

end
