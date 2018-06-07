class LandmarksController < ApplicationController
  get "/landmarks" do
    erb :"/landmarks/index"
  end

  get "/landmarks/new" do
    erb :"/landmarks/new"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  post "/landmarks/new" do
    @landmark = Landmark.find_or_create_by(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

  patch "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
    @landmark.update(year_completed: params[:landmark][:year_completed]) unless params[:landmark][:year_completed].empty?
    redirect "/landmarks/#{@landmark.id}"
  end


end
