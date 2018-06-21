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

  get '/figures/:id' do
    @figure =  Figure.find(params[:id])
    erb :'figures/show'
  end


  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

      if !params[:title][:name].empty?
        @figure.titles << Title.create(name: params[:title][:name])
      end

      if !params[:figure][:title_ids].nil? && !params[:figure][:title_ids].empty?
        params[:figure][:title_ids].each do |title_id|
          @figure.titles << Title.find(title_id)
        end
      end

      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end


      if !params[:figure][:landmark_ids].nil? && !params[:figure][:landmark_ids].empty?
        #binding.pry
        params[:figure][:landmark_ids].each do |landmark_id|
          @figure.landmarks << Landmark.find(landmark_id)
        end
      end
      @figure.save
      redirect :"/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
  @figure = Figure.find(params[:id])
  @landmarks = Landmark.all
  @titles = Title.all
  erb :'/figures/edit'
  end

  patch '/figures/:id' do

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:figure][:title_ids].nil? && !params[:figure][:title_ids].empty?
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end


    if !params[:figure][:landmark_ids].nil? && !params[:figure][:landmark_ids].empty?
      params[:figure][:landmark_ids].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end

    @figure.save
    redirect to("/figures/#{@figure.id}")
  end


end
