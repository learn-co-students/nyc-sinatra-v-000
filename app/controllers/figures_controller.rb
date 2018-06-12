class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all
		erb :'/figures/index'		
	end

	get '/figures/new' do
		@landmarks = Landmark.all
		@titles = Title.all
		erb :'/figures/new'
	end

	post '/figures/new' do
		@figure = Figure.create(params[:figure])
		if !params[:title][:name].empty?
			@title = Title.create(params[:title])
			@figure.figure_titles.create(title: @title)
		elsif !params[:landmark][:name].empty?
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end
		@figure.save
		redirect '/figures'
	end

	get '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		erb :'/figures/show'
	end

	get '/figures/:id/edit' do
		@figure = Figure.find_by_id(params[:id])
		erb :'/figures/edit'
	end

	post '/figures/:id/edit' do
		@figure = Figure.find_by_id(params[:figure][:id])
		@figure.update(params[:figure])
		if !params[:title][:name].empty?
			@title = Title.create(params[:title])
			@figure.figure_titles.create(title: @title)
		elsif !params[:landmark][:name].empty?
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end
		@figure.save
		redirect "/figures/#{@figure.id}"
	end

end