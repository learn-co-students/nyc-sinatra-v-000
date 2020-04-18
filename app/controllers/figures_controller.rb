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

  get '/figures/:slug' do
    @figure = Figure.find_by(id: params[:slug])
    erb :'/figures/show'
  end

  get '/figures/:slug/edit' do
    @figure = Figure.find_by(id: params[:slug])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    figure.titles << @title if (params[:title][:name].length > 0 && !!(@title = Title.create(params[:title])))
    figure.landmarks << @landmark if (params[:landmark][:name].length > 0 && !!(@landmark = Landmark.create(params[:landmark])))
    figure.save
    redirect "/figures/#{@figure.slug}"
  end

  patch '/figures/:slug' do
    figure = Figure.find_by(id: params[:slug])
    figure.update(params[:figure])
    figure.titles << @title if (params[:title][:name].length > 0 && !!(@title = Title.create(params[:title])))
    figure.landmarks << @landmark if (params[:landmark][:name].length > 0 && !!(@landmark = Landmark.create(params[:landmark])))
    figure.save
    redirect "/figures/#{@figure.slug}"
  end

end
