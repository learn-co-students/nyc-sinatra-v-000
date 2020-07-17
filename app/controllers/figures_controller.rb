class FiguresController < ApplicationController
  
  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    @figure = Figure.create(:name => params["figure"]["name"], :title_ids => params["figure"]["title_ids"], :landmark_ids => params["figure"]["landmark_ids"])

    if !params[:title][:name].empty?       
      @figure.titles << Title.create(params[:title])    
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end

    @figure.save
    redirect '/figures'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params["figure"]["name"]

    if !params[:figure][:landmark].empty?
      @figure.landmarks << Landmark.create(:name => params[:figure][:landmark])
    end

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
