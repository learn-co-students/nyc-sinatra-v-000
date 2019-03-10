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
		@figure = Figure.find_or_create_by(name: params[:figure][:name])

		if params[:figure][:landmark_ids].present?
			params[:figure][:landmark_ids].each do |landmark|
				@figure.landmarks << Landmark.find(landmark)
			end
		end
		if params[:landmark][:name].present?
			@figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
		end
		if params[:figure][:title_ids].present?
			params[:figure][:title_ids].each do |title|
				@figure.titles << Title.find(title)
			end
		end
		if params[:title][:name].present?
			@figure.titles << Title.find_or_create_by(name: params[:title][:name])
		end
		redirect to "/figures/#{@figure.id}"
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		erb :'figures/show'
	end

	get '/figures/:id/edit' do 
		@figure = Figure.find(params[:id])
		@titles = Title.all 
		@landmarks = Landmark.all
		erb :'figures/edit'
	end
	
	patch '/figures/:id' do 
		@figure = Figure.find(params[:id])
		@figure.name = params[:figure][:name]
		if params[:figure][:landmark_ids].present?
			params[:figure][:landmark_ids].each do |landmark|
				@figure.landmarks << Landmark.find(landmark)
			end
		end
		if params[:landmark][:name].present?
			@figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
		end
		if params[:figure][:title_ids].present?
			params[:figure][:title_ids].each do |title|
				@figure.titles << Title.find(title)
			end
		end
		if params[:title][:name].present?
			@figure.titles << Title.find_or_create_by(name: params[:title][:name])
		end
		@figure.save
		redirect to "/figures/#{@figure.id}"
	end
end
