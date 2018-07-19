class FiguresController < ApplicationController

  get "/figures/new" do
    erb :"/figures/new"
  end

  get "/figures/:id" do
  #find id and define class variable for object
    erb :"figures/:id"
  end

  post "/figures" do
    
    redirect "/figures/:id"
  end



end
