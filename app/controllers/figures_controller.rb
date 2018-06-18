class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    #should be able to select MULTIPLE titles, drawing from the checkboxes AND the "New Title Name" textbox
    #should be able to select MULTIPLE landmarks, drawing from the checkboxes AND the "landmark[name]/landmark[year]" textboxes
    @figure.save
    redirect to "figures/#{@figure.slug}"
  end

  get '/figures/:slug/edit' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/edit'
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/show'
  end

  patch '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    @figure.update(params[:figure])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.save
    #should be able to select MULTIPLE titles, drawing from the checkboxes AND the "New Title Name" textbox
    #should be able to select MULTIPLE landmarks, drawing from the checkboxes AND the "New Landmark Name"/"New Landmark Year" textboxes
    redirect to "figures/#{@figure.slug}"
  end

end
