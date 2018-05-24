class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    puts "Params = #{params}"
    data = params["landmark"]
    @landmark = Landmark.create(name: data[:name], year_completed: data[:year_completed])
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    data = params["landmark"]
    @landmark.update(name: data[:name], year_completed: data[:year_completed])
    redirect to "/landmarks/#{@landmark.id}"
  end


end

# rspec spec/landmarks_controller_view_spec.rb

# nyc-sinatra-v-000
