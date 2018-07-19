class FiguresController < ApplicationController

  get "/figures/new" do
    erb :"/figures/new"
  end

  get "/figures/:id" do
    @figure =Figure.find_by(id: params[:id])
    erb :"figures/single"
  end

  post "/figures" do
    new_figure = Figure.create(params[:figure])
    new_figure.titles << Title.find_or_create_by(params[:title])
    new_figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    redirect "/figures"
  end


  get "/figures" do
    @figures = Figure.all
    erb :"/figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by(id: params[:id])
    erb :"/figures/edit"
  end

  patch "/figures/:id" do
    @updated_figure = Figure.find_by(id: params[:id])
    @updated_figure.name = params[:figure][:name]
    title = Title.find_by(id: params[:figure][:title_ids])
    if title
      @updated_figure.titles << title
    else

    end
    @updated_figure.landmarks << Landmark.find_or_create_by(name: params[:figure][:landmark])
    @updated_figure.save
    redirect "/figures/#{@updated_figure.id}"
  end


end
