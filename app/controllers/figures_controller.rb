

class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get "/figures/new" do
    # class.all for creation options
    erb :"/figures/new"
  end

  post "/figures" do
    # create figure plus side operations
    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find_by(id: params[:id])
    erb :"/figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by(id: params[:id])
    # class.all for edit options
    erb :"/figures/edit"
  end

  patch "/figures/:id" do
    # grab params and update figure
    redirect "/figures/#{@figure.id}"
  end

end
