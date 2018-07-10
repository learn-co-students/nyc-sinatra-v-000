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

    if !params[:title][:name].empty?
      new_Title.create(:name => params[:title][:name])
      new_Title.figures << figure
    end
    params[:figure][:landmark_ids].each do |landmark|
      #binding.pry
      Landmark.find(landmark.values.first).figure_id = figure.id
    end
    if !params[:landmark[:name]].empty? && !params[:landmark][:year].empty?
        new_landmark = Landmark.create(:name => params[:landmark_name], :year_completed => params[:landmark_year], :figure_id => figure.id)
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end
end
#<label for="landmark_name">Name: </label>
#<input type="text" name="landmark[name]" id="landmark_name"></input>
#<label for="landmark_year">Year: </label>
#<input type="text" name="figure[landmark_year]" id="landmark_year"></input>
#<input type="submit" id="Create New Figure" value="Create New Figure"></input>
