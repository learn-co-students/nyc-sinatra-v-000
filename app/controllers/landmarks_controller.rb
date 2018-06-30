class LandmarksController < ApplicationController
	get '/landmarks' do
		@landmarks = Landmark.all
		erb :'/landmarks/index'
	end


	get '/landmarks/new' do 
		@figures = Figure.all
		erb :'/landmarks/new'
	end

	post '/landmarks' do
		@landmark = Landmark.create(params[:landmark]) 
		if !params["landmark_name"]["landmark_year_completed"].empty?
			@landmark.figure = Landmark.create(params["landmark"])
		end
		@landmark.save
		redirect to("/landmarks/#{@landmark.id}")
	end

	get '/landmarks/:id' do
		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/show'
	end

	get '/landmarks/:id/edit' do 
    	@landmark = Landmark.find_by(params[:id])
    	erb :'/landmarks/edit'
  	end

  	post '/landmarks/:id' do 
   		@landmark = Landmark.find(params[:id])
   		 @landmark.update(params["landmark"])
    		if !params["name"].empty?
      		@landmark.title = Figure.create(name: params["figure"]["name"])
    	end
    	@landmark.save
    	redirect to "landmarks/#{@landmark.id}"
  end

end
