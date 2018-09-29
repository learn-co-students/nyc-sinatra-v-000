class LandmarksController < ApplicationController
  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  post "/landmarks" do
    # binding.pry
    @landmark = Landmark.create(:name => params["landmark"]["name"], :year_completed => params["landmark"]["year_completed"])
    @landmark.save
    redirect '/landmarks'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params["landmark"]["name"]

    # if !params[:landmark][:landmark].empty?
    #   @landmark.landmarks << Landmark.create(:name => params[:landmark][:landmark])
    # end

    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
end
