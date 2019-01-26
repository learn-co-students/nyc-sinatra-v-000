class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
  	@figures = Figure.all

  	erb :"figures/index"
  end

  get '/figures/new' do
  	@titles = Title.all
  	@landmarks = Landmark.all

  	erb :'/figures/new'
  end

  get '/figures/:id/edit' do
  	@figure = Figure.find(params[:id])
  	@titles = Title.all
  	@landmarks = Landmark.all
  	erb :"/figures/edit"
  end

  patch '/figures/:id' do
  	@figure = Figure.find(params[:id])
  	

  	# if user selected, or unchecked titles, make sure to create an empty list
  	if !params.keys.include?("title_ids")
  		params[:figure][:title_ids] = []
  	end

  	
  	# if user selected, or unchecked all landmarks, create empty array
  	if !params.keys.include?("landmark_ids")
  		params[:figure][:landmark_ids] = []
  	end

  	# if user entered a new title name, make sure to create a new title entry
  	if !params[:title][:name].empty?
  		new_title = Title.find_or_create_by(params[:title])
  		params[:figure][:title_ids] << new_title.id
  	end

  	# if user entered a new landmark name, create a new landmark entry
  	if !params[:landmark][:name].empty?
  		new_landmark = Landmark.find_or_create_by(params[:landmark])
  		params[:figure][:landmark_ids] << new_landmark.id
  	end

  	@figure.update(params[:figure])
  	@figure.save
  	

  	redirect "/figures/#{@figure.id}"
  end

  post '/figures' do
  	# if an existing title was selected, then create a new title based on the user inputed value
  	# using find_or_create_by to avoid duplication of titles
  	if !params[:figure].keys.include?("title_ids")
  		new_title = Title.find_or_create_by(params[:title])
  		params[:figure][:title_ids] = [new_title.id]
  	end
  	
  	# did the user give a new landmark?
  	if !params[:figure].keys.include?("landmark_ids")
  		new_landmark = Landmark.find_or_create_by(params[:landmark])
  		params[:figure][:landmark_ids] = [new_landmark.id]
  	end

  	@figure = Figure.create(params[:figure])

  	redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
  	
  	@figure = Figure.find(params[:id])

  	erb :'figures/show'
  end
end
