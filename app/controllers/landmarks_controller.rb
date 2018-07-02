class LandmarksController < ApplicationController


    #index action
    get '/landmarks' do
      @landmarks = Landmark.all
      erb :"/landmarks/index"
    end

    #new action
    get '/landmarks/new' do
      @landmarks = Landmark.all
      erb :"/landmarks/new"
    end

    post '/landmarks' do
      @landmark = Landmark.create(name: params[:name])
      redirect to "/landmarks/#{@landmark.id}"
    end

    #show action
    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :"/landmarks/show"
    end

    #edit action
    get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      erb :"/landmarks/edit"
    end

    patch '/landmarks/:id' do
      @landmark = Landmark.find_by_id(params[:id])
      @landmark.update(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
      redirect to "/landmarks/#{@landmark.id}"
    end

end
