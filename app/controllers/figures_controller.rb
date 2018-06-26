class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    #raise params.inspect
    #binding.pry
    @figure = Figure.create(name: params["figure_name"])
    if params["new_title"] != ""
      @figure.titles << Title.create(name: params["new_title"])
    end
    if params[:new_landmark] != ""
      @figure.landmarks << Landmark.create(name: params["new_landmark"] , year_completed:params["new_landmark_year_completed"])
    end

    @figure.save
    erb :'/figures/show'

  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure = Figure.update(name: params["figure_name"])

    @figure.save
    redirect '/figures/:id'
  end

end
