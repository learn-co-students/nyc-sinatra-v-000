class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
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

end
