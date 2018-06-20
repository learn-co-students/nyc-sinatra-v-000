class FiguresController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/") }

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params[figure][name])
    if !params[title][name].empty?
      @figure.titles << Title.create(params[title][name])
    end
  end

  get '/figures' do

    @figures = Figure.all
    erb :"figures/index"
  end

end
