class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  post '/figures' do
    # binding.pry
   #  {"figure"=>{"name"=>"Donald Trump", "title_ids"=>["3"], "landmark_ids"=>["1"]},
   # "title"=>{"name"=>"Your Fired!"},
   # "landmark"=>{"name"=>"Trump Tower", "year"=>"1974"},
   # "submit"=>"Create New Figure"}
   @figure = Figure.create(params[:figure])
   @figure.titles << Title.create(params[:title])
   @figure.landmarks << Landmark.create(name: params[:landmark][:new_landmark], year_completed: params[:landmark][:year_completed])
   @figure.save

   redirect :"/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do

  end

  patch '/figures' do

  end

end
