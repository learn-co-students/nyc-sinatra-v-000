class FiguresController < ApplicationController
  # add controller methods
  get "/figures/new" do
    erb :'figures/new'
  end

  post "/figures" do 
    figure = Figure.create(name: params[:figure][:name])
    if params[:figure][:title_ids].nil?
      title = Title.create(params[:title])
      figure.titles << title
    else 
      figure.title_ids = params[:figure][:title_ids]
    end
    if params[:figure][:landmark_ids].nil?
      landmark = Landmark.create(params[:landmark])
      figure.landmarks << landmark
    else 
      figure.landmark_ids = params[:figure][:landmark_ids]
    end
    figure.save
  end

  get "/figures" do 
    @figures = Figure.all
    erb :'figures/show'
  end

  get "/figures/:id" do
    @figures = [Figure.find(params[:id])]
    erb :'figures/show'
  end

  get "/figures/:id/edit" do 
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end 

  patch "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    landmark = Landmark.create(params[:landmark])
    @figure.landmarks << landmark
    @figure.save
    redirect to "/figures/#{figure.id}"
  end
end
