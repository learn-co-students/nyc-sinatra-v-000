class FiguresController < ApplicationController

  get '/figures' do #index page request
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do #create page request
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do #create and redirect
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty? #hence user fills out new entry
      #creation handles id automatically
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty? #NOT empty
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    redirect "/figures/#{@figure.slug}"
  end

  get '/figures/:id' do #Show page request
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do #edit page request
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/edit"
  end

  patch '/figures/:id' do #edit and redirect
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    @landmark = Landmark.create(params[:landmark])
    redirect :"/figures/#{@figure.id}"
  end

end
