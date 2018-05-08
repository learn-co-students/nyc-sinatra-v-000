class FiguresController < ApplicationController


  get '/figures' do 

  	@figures = Figure.all


  	erb :'figures/index'
  end


  get '/figures/new' do 

  	@titles = Title.all
  	@landmarks = Landmark.all

  	erb :'figures/new'

  end

  post '/figures' do

  	  @figure = Figure.create(params["figure"])

      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end

      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end
      
      @figure.save

      redirect to "/figures/#{@figure.id}"

  	# @figure = Figure.find_or_create_by(name: params["figure"]["name"])

  	# @figure.titles << Title.find_by(id: params[:figure][:title_ids])

  	# @figure.landmarks << Landmark.find_by(id: figure[:landmark_ids][])
  	# @figure.save

  	# erb :'figures/index'

  end

	get '/figures/:id/edit' do

	  @figure = Figure.find_by(id: params[:id])

	  erb :'figures/edit'
	end

  	get '/figures/:id' do


  	  @figure = Figure.find_by(id: params[:id])

  	  
  	  erb :'figures/show'

  	end

  	

  	patch '/figures/:id' do 
  		@figure = Figure.find(params[:id])
  		@figure.update(params[:figure])
  		@landmark = Landmark.find_or_create_by(params[:landmark])
  		@figure.landmarks << @landmark
  		@figure.save

  		redirect to "/figures/#{@figure.id}"

  	end




end