class FiguresController < ApplicationController

	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'figures/new'
	end

	post '/figures' do
		@figure = Figure.new
		@figure.name = params[:figure][:name]
		@title = Title.new(name: params[:title][:name])
		@title.save
		@landmark = Landmark.new(name: params[:landmark][:name])
		@landmark.save
		@figure.title_ids = params[:figure][:title_ids] || [@title.id]
		@figure.landmark_ids = params[:figure][:landmark_ids] || [@landmark.id]
		@figure.save
		redirect '/index'
	end

	get '/figures' do
		@figures = Figure.all
		erb :'figures/index'
	end

	get '/figures/:id' do
		@figure = Figure.find_by(params[:id])
		erb :'figures/show'
	end

	get '/figures/:id/edit' do
		@figure = Figure.find_by(params[:id])
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'figures/edit'
	end

	patch '/figures/:id' do
		@figure = Figure.find_by(params[:id])
		@figure.name = params[:figure][:name]
		@landmark = Landmark.new
		@landmark.name = params[:landmark][:name]
		@landmark.save
		@figure.landmarks = []
		@figure.landmarks << @landmark
		@figure.save
		erb :'figures/show'
	end

end
