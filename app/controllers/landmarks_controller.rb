class LandmarksController < ApplicationController


  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

post '/landmarks/:id' do
  @landmark = Landmark.create(params[:landmark])
  @landmark.save
  # binding.pry
  # Landmark.all << @landmark
  erb :"/landmarks/show"
end

patch '/landmarks/show/:id' do
  # raise params.inspect

  @landmark = Landmark.find(params[:id])
  # binding.pry
  @landmark.update(params[:landmark])
  #
  redirect to :"/landmarks/#{@landmark.id}"
end

end
