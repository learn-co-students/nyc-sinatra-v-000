class FiguresController < ApplicationController
	get "/figures" do
		@figures = Figure.all
		erb :"figures/index"
	end

	get "/figures/new" do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :"figures/new"
	end

	post "/figures" do
		figure = Figure.new(params[:figure])

		if new_title_requested?
			figure.titles.build(params[:title])
		end

		if new_landmark_requested?
			figure.landmarks.build(params[:landmark])
		end

		figure.save ? redirect("/figures/#{figure.id}") : "you stupid, enter stuff correctly fewl."
	end

	get "/figures/:id" do
		@figure = Figure.find(params[:id])
		erb :"figures/show"
	end

	get "/figures/:id/edit" do
		@figure = Figure.find(params[:id])
		@titles = Title.all
		@landmarks = Landmark.all
		erb :"figures/edit"
	end

	patch "/figures/:id" do
		figure = Figure.find(params[:id])

		figure.update(params[:figure])

		if new_title_requested?
			figure.titles.build(params[:title])
		end

		if new_landmark_requested?
			figure.landmarks.build(params[:landmark])
		end

		figure.save ? redirect("/figures/#{figure.id}") : "you stupid, enter stuff correctly fewl."
	end

	helpers do
		def new_title_requested?
			!params[:title][:name].empty?
		end

		def new_landmark_requested?
			!params[:landmark][:name].empty?
		end
	end
end
