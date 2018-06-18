class FiguresController < ApplicationController

	get '/figures' do 
		@figures = Figure.all
		erb :"figures/index"
	end

	get '/figures/new' do 

		erb :"figures/new"

	end

	post '/figures' do 
		
		@new_figure = Figure.create(params[:figure])
		if !params[:title][:name].empty?
			@new_figure.titles << Title.create(params[:title])
		end
		if !params[:landmark][:name].empty?
			@new_figure.landmarks << Landmark.create(params[:landmark])
		end
		

		@new_figure.save

		
		redirect to "figures/#{@new_figure.id}"
	end

	get '/figures/:id/edit' do 

		@new_figure = Figure.find(params[:id])
		
		erb :"/figures/edit"
	end

	get '/figures/:id' do 

		@new_figure = Figure.find(params[:id])

		erb :"/figures/show"

	end

	post '/figures/:id' do 
		@new_figure = Figure.find(params[:id])
		@new_figure.update(params[:figure])
		if !params[:title][:name].empty?
			@new_figure.titles << Title.create(name: params[:title][:name])
		end
		if !params[:landmark][:name].empty?
			@new_figure.landmarks << Landmark.create(name: params[:landmark][:name])
		end

		@new_figure.save

		redirect to "/figures/#{@new_figure.id}"
	end

end
