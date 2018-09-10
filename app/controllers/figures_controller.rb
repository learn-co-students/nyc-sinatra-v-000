class FiguresController < ApplicationController

	get '/figures' do
		#binding.pry
		@figures = Figure.all
		erb :'/figures/index'
	end

	get '/figures/new' do
		#binding.pry
		erb :'/figures/new'
	end

	get '/figures/:id' do
		@figure = Figure.find_by(id: params[:id])
		erb :'/figures/show'
	end

	post '/figures' do
		#binding.pry
		@figure = Figure.create(name: params["figure"]["name"])
		binding.pry

		new_title = Title.all.find_or_create_by(name: params["new_title"])
		#associate new-title to figure here
		#binding.pry
		redirect "/figures/#{@figure.id}"
	end
end
