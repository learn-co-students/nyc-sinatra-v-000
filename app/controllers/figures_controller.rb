class FiguresController < ApplicationController

  get '/figures' do  # load the index page
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do  #load a new page with loaded data

    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do # create a figure
    titles =[]
    if params[:title][:name] != ""
        titles << Title.create(name: params[:title][:name])
    end
    if params[:figure][:title_ids] && !params[:figure][:title_ids].empty?
        params[:figure][:title_ids].each do |id|
          titles << Title.find_by_id(id)
      end
    end

    landmarks =[]
    if params[:landmark][:name] != ""
        landmarks << Landmark.create(name: params[:landmark][:name])
    end
    if  params[:figure][:landmark_ids] && !params[:figure][:landmark_ids].empty?
        params[:figure][:landmark_ids].each do |id|
          landmarks << Landmark.find_by_id(id)
      end
    end

    @figure = Figure.create(titles: titles, name: params[:figure][:name], landmarks: landmarks)
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do # load the show page with one figure
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do # load the edit page with one figure
    @figure = Figure.find_by(params[:id])
    erb :'/figures/edit'
  end

    post '/figures/:id' do #edit a figure
      @figure = Figure.find_by(params[:id])
      titles =[]
      if params[:title][:name] != ""
          titles << Title.create(name: params[:title][:name])
        end
      if params[:figure][:title_ids] && !params[:figure][:title_ids].empty?
          params[:figure][:title_ids].each do |id|
            titles << Title.find_by_id(id)
        end
      end

      landmarks =[]
      if params[:landmark][:name] != ""
          landmarks << Landmark.create(name: params[:landmark][:name])
      end

      if  params[:figure][:landmark_ids] && !params[:figure][:landmark_ids].empty?
          params[:figure][:landmark_ids].each do |id|
            landmarks << Landmark.find_by_id(id)
        end
      end

      @figure.update(titles: titles, name: params[:figure][:name], landmarks: landmarks)
      redirect to "/figures/#{@figure.id}"
    end
end
