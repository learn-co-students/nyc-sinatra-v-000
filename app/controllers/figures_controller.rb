class FiguresController < ApplicationController
  # add controller methods
  get "/figures" do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/new" do
    binding.pry
    @figure =
    erb :'/figures/new'
  end

  get "/figures/:id" do
    erb :'/figures/show'
  end

  post "/figures" do
    binding.pry
    @figure = Figure.find_by()
    redirect to("/figures/#{@figure.id}")
  end

  get "/figures/:id/edit" do
    erb :"/figures/edit"
  end

  patch "/figures/:id" do
    redirect to("/figures/#{@figure.id}")
  end
end
