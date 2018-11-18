class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    # @figure.titles.create(params[:title]) if params[:title] !=""
    # @figure.landmarks.create(name: params[:landmark][:name]) if params[:landmark][:name] !=""
    # binding.pry
    if !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each{|landmark| @figure.landmarks << Landmark.find(landmark)}
    end
    
    if params[:landmark][:name] != ""
      @figure.landmarks.create(params[:landmark])
    end

    @figure.titles.clear
    if !!params[:figure][:title_ids]
      params[:figure][:title_ids].each{|title| @figure.titles << Title.find(title)}
    end

    if params[:title][:name] != ""
      @figure.titles.create(params[:title])
    end

    @figure.save

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    # binding.pry
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update({name: params[:figure][:name]})
    # binding.pry

    @figure.landmarks.clear
    if !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each{|landmark| @figure.landmarks << Landmark.find(landmark)}
    end
    
    if params[:landmark][:name] != ""
      @figure.landmarks.create(params[:landmark])
    end

    @figure.titles.clear
    if !!params[:figure][:title_ids]
      params[:figure][:title_ids].each{|title| @figure.titles << Title.find(title)}
    end

    if params[:title][:name] != ""
      @figure.titles.create(params[:title])
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end
end
