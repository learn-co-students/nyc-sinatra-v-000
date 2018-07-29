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
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :'/figures/edit'
  end

  post '/figures/:id' do

    @figure = Figure.find(params[:id])

    if params[:figure][:name] != @figure.name
      @figure.name = params[:figure][:name]
    end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"]) # params[:landmark] == params["landmark"]
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"

  end

  post '/figures' do
    #@figure = Figure.create(name: params[:figure][:name])
    #params[:figure][:title_ids].each do |ft|
    #  @figure_title = FigureTitle.create(title_id: ft)
    #  @figure_title.figure_id = @figure.id
    #  @figure_title.save
    #end

    @figure = Figure.create(params["figure"]) # line of code takes the place of the commented code above

    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params[:title]) # params[:title] == params["title"]
    end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"]) # params[:landmark] == params["landmark"]
    end

    @figure.save # Determine if this is necessary

    redirect to "/figures/#{@figure.id}"
  end

end
