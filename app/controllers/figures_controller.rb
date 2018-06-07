class FiguresController < ApplicationController

  get "/figures" do
    erb :"/figures/index"
  end

  get "/figures/new" do
    erb :"/figures/new"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  post "/figures/new" do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.title_ids = @figure.title_ids << @title.id
      @title.save
    end
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
      @landmark.save
    end
    @figure.save
    redirect "/figure/#{@figure.id}"
  end

  patch "/figures/:id/edit" do
    binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:landmark]
      @landmark = Landmark.find_or_create_by(name: params[:landmark])
      @figure.title_ids = @figure.title_ids << @landmark.id
      @landmark.save
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
