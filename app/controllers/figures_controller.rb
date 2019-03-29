class FiguresController < ApplicationController
  # add controller methods
  get "/figures" do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/new" do
    erb :'/figures/new'
  end

  get "/figures/:id" do
    erb :'/figures/show'
  end

  post "/figure" do
    redirect to("/figures/#{@figure.id}")
  end

  get "/figure/:id/edit" do
    erb :"/landmarks/edit"
  end

  patch "/figure/:id" do
    redirect to("/figures/#{@figure.id}")
  end
end
