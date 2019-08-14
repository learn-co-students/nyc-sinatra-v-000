class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    # @titles = Title.all
    # @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    # create a new figure
    # binding.pry
    @figure = Figure.create(params['figure'])
    # with existing title
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    # with new title

    # with existing landmark
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    # with new landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
   @figure.update(params[:figure])


   unless params[:title][:name].empty?
     @figure.titles << Title.create(params[:title])
   end

   unless params[:landmark][:name].empty?
     @landmarks << Landmark.create(params[:landmark])
   end

   @figure.save

   redirect "/figures/#{@figure.id}"
  end
end
