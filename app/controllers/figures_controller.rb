class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  post '/figures' do
    binding.pry
    # Figure
    @figure = Figure.create(:name => params[:figure])
    #Adding new titles
    if !params[:title][:name].empty?
      @figure.titles << Title.create(:name => params[:title][:name])
    end

    #Landmarks
    redirect "figures/#{@figure.id}"
  end

end
