class FiguresController < ApplicationController

    get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figures = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figures = Figure.find(params[:id])

    erb :'/figures/edit'
  end


  post '/figures' do
    @figures = Figure.create(params["figure"])
    if !params[:landmark][:name].empty?
      @figures.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figures.titles << Title.create(params[:title])
    end
    @figures.save
    redirect "/figures/#{@figures.id}"
  end

  post '/figures/:id' do
    @figures = Figure.find(params[:id])
    @figures.update(params[:figure])

    if !params[:landmark][:name].empty?
      @figures.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figures.titles << Title.create(params[:title])
    end
    @figures.save

    redirect "/figures/#{@figures.id}"
  end

end
