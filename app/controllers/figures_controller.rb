class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  post '/figures' do
    #binding.pry
    figure = Figure.new(:name => params[:figure][:name])

    if !params[:figure][:title_name].empty?
      new_Title.create(:name => params[:title_name])
      new_Title.figures << figure
    end
    params[:figure][:landmarks].each do |landmark|
      #binding.pry
      Landmark.find(landmark.values.first).figure_id = figure.id
    end
    if !params[:figure][:landmark_name].empty? && !params[:figure][:landmark_year].empty?
        new_landmark = Landmark.create(:name => params[:landmark_name], :year_completed => params[:landmark_year], :figure_id => figure.id)
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end
end
