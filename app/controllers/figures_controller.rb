class FiguresController < ApplicationController
  get '/figures' do
    @list = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do

    @landmarks = []
    params[:landmark].each do |l|
      landmark = Landmark.find_by(name: l.name) || Landmark.create(l)
      @landmarks << landmark
    end
    if !params[:landmark_name].empty?
      @landmarks << Landmark.create(name: params[:landmark_name], year: params[:landmark_year])
    end

    @titles = []
    params[:title].each do |t|
      title = Title.find_by(name: t.name) || Title.create(t)
      @titles << title
    end
    if !params[:title_name].empty?
      @titles << Title.create(name: params[:title_name])
    end

    @figure = Figure.create(name: params[:figure_name], titles: "#{@titles}", landmarks: "#{@landmarks}")

    redirect "/figures/#{@figure.slug}"
  end

  get '/figures/:slug/edit' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'figures/edit'
  end

  post '/figures/:slug' do

    @landmarks = []
    params[:landmark].each do |l|
      landmark = Landmark.find_by(name: l.name) || Landmark.create(l)
      @landmarks << landmark
    end
    if !params[:landmark_name].empty?
      @landmarks << Landmark.create(name: params[:landmark_name], year: params[:landmark_year])
    end

    @titles = []
    params[:title].each do |t|
      title = Title.find_by(name: t.name) || Title.create(t)
      @titles << title
    end
    if !params[:title_name].empty?
      @titles << Title.create(name: params[:title_name])
    end

    @figure = Figure.update(name: params[:figure_name], titles: "#{@titles}", landmarks: "#{@landmarks}")

    redirect "/figures/#{@figure.slug}"
  end

  get '/figures/:slug' do
    @slug = Figure.find_by_slug(params[:slug])
    erb :'figures/show'
  end

end
