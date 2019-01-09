class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  post '/figures' do
    binding.pry
    # Figure
    @figure = Figure.create(:name => params[:figure][:name])
    #Titles
    @titles = []
    #Adding new titles
    if !params[:titles][:name].nil?
      @titles << Title.create(:name => params[:titles][:name])
    end
    #Adding existing titles
    if params[:titles][:title_ids] != []
      params[:titles][:title_ids].each do |id|
        @titles << Title.find_by(id)
      end
    end
    #Landmarks
  end

end
