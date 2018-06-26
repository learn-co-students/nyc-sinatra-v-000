class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])

    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(:name => params["figure_name"])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect("/figures/#{@figure.id}")
  end

end
