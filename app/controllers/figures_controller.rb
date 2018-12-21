class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title][:name].strip != ""
      @figure.titles << Title.create(:name => params[:title][:name])
    end
    if params[:landmark][:name].strip != ""
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end
    erb :"/figures/show"
  end

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    if params[:figure][:name].strip != ""
      figure.update(:name => params[:figure][:name])
    end
    if !!params[:figure][:title_ids]
      figure.update(params[:figure][:title_ids])
    end
    if !!params[:landmark]
      figure.landmarks << Landmark.create(:name => params[:landmark][:name], :year => params[:landmark][:year])
    end
    figure.save
    redirect to "/figures/#{params[:id]}"
  end

end
