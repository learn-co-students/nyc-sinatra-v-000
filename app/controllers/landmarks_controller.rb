class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
   @landmarks = Landmark.all
   erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])

  #  unless params[:title][:name].empty?
  #    @landmark.titles << Title.create(params[:title])
  #  end

  #  unless params[:figure][:name].empty?
  #    @landmark.figure << Landmark.create(params[:figure])
  #  end

    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end


 patch '/landmarks/:id' do
   @landmark = Landmark.find(params[:id])
   @landmark.update(params[:landmark])

  # unless params[:title][:name].empty?
  #   @landmark.titles << Title.create(params[:title])
   #end

  # unless params[:figure][:name].empty?
#     @landmark.figure << Landmark.create(params[:figure])
#   end

   @landmark.save
   redirect to "/landmarks/#{@landmark.id}"
 end


end
