require 'rack-flash'
require 'rack/flash/test' # => https://github.com/nakajima/rack-flash/issues/1
require 'pry'

class LandmarksController < ApplicationController
  use Rack::Flash

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    flash[:message] = "Successfully created Landmark."
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark]) # instead of using create

    @figure.save

    flash[:message] = "Successfully updated Landmark."
    erb :'landmarks/show'
  end

end
