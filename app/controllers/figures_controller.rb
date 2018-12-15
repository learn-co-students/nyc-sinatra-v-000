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

  post '/figures' do

    @figure = Figure.create(name: params[:figure][:name])

    if !params[:title][:name].empty? # if theres an entry into the new title box
      @figure.titles << Title.create(name: params[:title][:name]) #create that title and throw into our figure's titles
    elsif !params[:figure][:title_ids].empty? #or if there is something clicked
      params[:figure][:title_ids].each do |title_id| #go through and
        @figure.titles << Title.find_by(id: title_id) # put each clicked box's id into our figure's titles
      end
    end

    puts params

    if !params[:landmark][:name].empty? # if a landmark has been entered
      @figure.landmarks << Landmark.create(name: params[:landmark][:name]) #create that landmark figure's landmarks
    end

    if !params[:figure][:landmark_ids].empty? #and if there is something clicked for landmarks
      params[:figure][:landmark_ids].each do |landmark_id| #go through each checkbox
        @figure.landmarks << Landmark.find_by(id: landmark_id) # and put each clicked box's id into our figure's landmark
      end
    end


  end

  get '/figures/show' do
    # @figure = Figure.find_by(name: params[:figure][:name])
    erb :'/figures/show'
  end




end
