class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures' do
    #binding.pry
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.create(params[:figure])
    if params[:title][:name] == ""
    else
      @newtitle = Title.create(name: params[:title][:name])
      @newtitle.save
      @figure.titles << @newtitle
    end

    if params[:landmark][:name] == ""
    else
      @newlandmark = Landmark.create(name: params[:landmark][:name])
      @newlandmark.save
      @figure.landmarks << @newlandmark
    end

    @figure.save
  end

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/:figure_id' do
    @figure = Figure.all.find_by(id: params[:figure_id])

    erb :"figures/show"
  end

  get '/figures/:figure_id/edit' do
    @figure = Figure.all.find_by(id: params[:figure_id])
    @titles = Title.all

    erb :"figures/edit"
  end

  patch '/figures/:figure_id' do
    @figure = Figure.all.find_by(id: params[:figure_id])
    @figure.update(name: params[:figure][:name])

    if params[:new_landmark] == ""
    else
      @newlandmark = Landmark.create(name: params[:new_landmark])
      @newlandmark.save
      @figure.landmarks << @newlandmark
    end
    #binding.pry
    @figure.save
    #binding.pry

    redirect("/figures/#{@figure.id}")

  end

end
