class FiguresController < ApplicationController

  get '/figures'do
    @figures = Figure.all
    erb :'figures/index'
  end

  get  '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title].blank?
      title = Title.create(params[:title])
      @figure.titles << title
      @figure.save
    end

    if !params[:landmark][:name].blank?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
      @figure.save
    end

    redirect to "/figures/#{@figure.id}"
  end

  post '/figures/:id' do

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]

    @figure.titles.clear
    if !params[:figure][:title_ids].blank?
      params[:figure][:title_ids].each do |e|
        title = Title.find(e)
        @figure.titles << title
      end
    end

    if !params[:title].blank?
      title = Title.create(params[:title])
      @figure.titles << title
    end

    @figure.landmarks.clear
    if !params[:figure][:landmark_ids].blank?
      params[:figure][:landmark_ids].each do |e|
        landmark = Landmark.find(e)
        @figure.landmarks << landmark
      end
    end

    if !params[:landmark][:name].blank?

      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end

    @figure.save
    #binding.pry
    #flash[:message] = "Successfully edited song."
    redirect to "/figures/#{@figure.id}"
  end

end
