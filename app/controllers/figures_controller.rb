class FiguresController < ApplicationController

  get "/figures" do
    erb :"figures/index"
  end

  get "/figures/new" do
    erb :"figures/new"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])

    erb :"figures/show"
  end

  post "/figures" do
    @figure = Figure.new(params[:figure])

    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])

    erb :"figures/edit"
  end

  patch "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.save

    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end

    redirect "/figures/#{@figure.id}"
  end


end
