class FiguresController < ApplicationController


    get '/figures/new' do
      @titles = Title.all
      @landmarks = Landmark.all
      @all_figures = Figure.all

      erb :'figures/new'
    end

    post '/figures' do

      @figure = Figure.create(params["figure"])
      #figure = Figure.find_or_create_by(name: params["figure_name"])

      title_params = params["title"]["name"]
      landmark_params = params["landmark"]

      if !title_params.empty?
        title = Title.create(params["title"])
        @figure.titles << title
      end

      if !landmark_params.empty?
          landmark = Landmark.create(landmark_params)
          @figure.landmarks << landmark
      end
      @figure.save

      #WANTED <Title id: 31, name: "Mr. President">]
      #CODE IS GIVIGIN <Title:0x000000046c96f8 id: 32, name: "Name">]

      redirect "/figures/#{@figure.id}" #moves to route GET '/figures/name'
    end

    get '/figures/:id' do

      erb :'figures/show'
    end

    get '/figures' do
      @figures = Figure.all

      erb :'figures/all'
    end

end
