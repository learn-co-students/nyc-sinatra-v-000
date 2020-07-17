class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title]) if params[:title][:name] != ""
    @figure.titles << @title if @title
    @landmark = Landmark.create(params[:landmark]) if params[:landmark][:name] != ""
    @figure.landmarks << @landmark if @landmark

    if !@title
      params[:figure][:titles_ids].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end

    if !@landmark
      params[:figure][:landmark_ids].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    @title = Title.create(params[:title]) if params[:title][:name] != ""
    @figure.titles << @title if @title
    @landmark = Landmark.create(params[:landmark]) if params[:landmark][:name] != ""
    @figure.landmarks << @landmark if @landmark

    if !@title
      params[:figure][:titles_ids].each do |title_id|
        @title = Title.find(title_id)
        @figure.titles << @title unless @figures.titles.include?(@title)
      end
    end

    if !@landmark
      params[:figure][:landmark_ids].each do |landmark_id|
        @landmark = Landmark.find(landmark_id)
        @figure.landmarks << @landmark unless @figure.landmarks.include?(@landmark)
      end
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
