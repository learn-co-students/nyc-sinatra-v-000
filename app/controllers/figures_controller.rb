  require 'pry'
class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])

    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id)
        @figure.save
      end
    end

    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |landmark_id|
        existing_landmark = Landmark.find(landmark_id)
        @figure.landmarks << existing_landmark
        existing_landmark.figure_id = @figure.id
        existing_landmark.save
        @figure.save
      end
    end

    if params[:title][:name] != nil
      @figure.titles << Title.create(:name => params[:title][:name])
      @figure.save
    end

    if params[:landmark][:name] != nil
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name],
        :figure_id => @figure.id)
      @figure.save
    end

    redirect to '/figures'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
   @figure = Figure.find(params[:id])
   erb :'/figures/edit'
 end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(:name => params[:figure][:name])
    @figure.titles = params[:title][:name]
    @figure.landmarks = params[:landmark][:name]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end

