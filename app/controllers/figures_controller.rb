class FiguresController < ApplicationController
  
  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    # binding.pry
    @figure = Figure.create(params[:figure])
    # binding.pry
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
      
      # :title_id => params[:figure][:title_ids[]])
    # , :landmark_id => params[:landmark_ids[]])
    # binding.pry

  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    # binding.pry
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:name]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end
end
