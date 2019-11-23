class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    figure.titles.build(params[:title]) unless params[:title][:name].blank?

    # figure.landmarks << Landmark.new(params[:landmark])
    figure.landmarks.build(params[:landmark]) unless params[:landmark][:name].blank?
    figure.save

    redirect to "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :"figures/edit"
  end

  patch '/figures/:id' do
    ####### Double bug fix - gets rid of existing titles and landmarks (There should be a way to refactor this, but how?)
    if params[:figure][:title_ids].nil?
      params[:figure][:title_ids] = []
    end

    if params[:figure][:landmark_ids].nil?
      params[:figure][:landmark_ids] = []
    end
    ####### End of double bug fix

    figure = Figure.find_by_id(params[:id])

    figure.update(params[:figure])
    figure.titles.build(params[:title]) unless params[:title][:name].blank?
    figure.landmarks.build(params[:landmark]) unless params[:landmark][:name].blank?
    figure.save

    redirect to "/figures/#{params[:id]}"
  end
end
