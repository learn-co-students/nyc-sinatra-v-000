class FiguresController < ApplicationController

  get '/' do
    @figures = Figure.all
    erb :'/figures/index'
  end

end
