class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do

    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do

   @figure = Figure.create(name: params[:figure][:name])

    titles =[]
   if params[:title][:name] != ""
     new_title = Title.create(name: params[:title][:name])
      titles << new_title
      params[:figure][:title_ids].each do |id|
       title = Title.find_by_id(id)
       titles << title
       @figure.title = titles
       @figure.save
     end
    else
      #  params[:figure][:title_ids].each do |id|
      #  title = Title.find_by_id(id)
      #  titles << title
      @figure.title_ids = params[:figure][:title_ids]
      @figure.save
    #  end
    #  @figure.title = titles
    #  @figure.save
    end

    binding.pry
    if params[:landmark] != ""
      landmark = Landmark.create(name:params[:landmark][:name], year: params[:landmark][:year])
      @figure.landmark = landmark
      @figure.save


    redirect to "/figures/#{@figure.id}"
  end


  post '/figures' do
    binding.pry
  end

  get '/figures/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'figres/edit'
  end
end
