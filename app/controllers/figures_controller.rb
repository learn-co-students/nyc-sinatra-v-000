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
     end
    else
        params[:figure][:title_ids].each do |id|
        title = Title.find_by_id(id)
        titles << title
      end
      @figure.title = titles
      @figure.save
    end



   binding.pry
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
