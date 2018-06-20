class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    if !params[:title][:name].empty?
    @figure.titles << Title.create(name: params[:title][:name])
    end
    if !params[:figure][:title_ids].empty?
      params[:figure][:title_ids].each do |title_id|
      @figure.titles << Title.find(title_id)
      end
    end
    binding.pry
    @figure.landmarks << Landmark.find_or_create_by(@figure.id)
    #@figure.landmarks << Landmark.find_or_create_by()
    erb :'/figures/show'
  end
end
