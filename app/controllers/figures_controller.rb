class FiguresController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/") }

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :"figures/new"
  end

  post '/figures' do

    @figure = Figure.create(name: params[:figure][:name])

    if @figure
      @figure.titles << Title.find(params[:figure][:title_ids]) if params[:figure][:title_ids]
      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids]) if params[:figure][:landmark_ids]
      @figure.titles << Title.create(name: params[:title][:name]) if params[:title][:name]
      @figure.landmarks << Landmark.create(name: params[:figure][:name]) if params[:figure][:name]
    end

    @figure.save

    redirect '/figures/:id'
  
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name]) if params[:figure][:name]
    @figure.titles << Title.find(params[:figure][:title_ids]) if params[:figure][:title_ids]
    @figure.landmarks << Landmark.find(params[:figure][:landmark_ids]) if params[:figure][:landmark_ids]
    @figure.titles << Title.create(params[:title][:name]) if params[:title][:name]
    @figure.landmarks << Landmark.create(params[:landmark][:name]) if params[:landmark][:name]

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end
