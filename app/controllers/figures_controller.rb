class FiguresController < ApplicationController
  
   get "/figures" do 
    @figures = Figure.all 
    erb :'/figures/index'
  end 
  
  get "/figuress/new" do 
    erb :'/figuress/new'
  end
  
  get "/figures/:id" do 
    @figure = Figure.find(params[:id])
    erb :'figures/show' 
  end
end
