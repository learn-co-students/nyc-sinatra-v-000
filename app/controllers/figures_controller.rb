class FiguresController < ApplicationController

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    @title = Title.create(:name => params[:title][:name])
    @landmark = Landmark.create(:name => params[:landmark][:name])
    @landmark.figure = @figure
    @figure.titles << @title
    binding.pry
  end

end
