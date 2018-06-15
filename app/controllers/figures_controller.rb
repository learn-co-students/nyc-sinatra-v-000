class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]

    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |title_id|
        title = Title.find(title_id)
        @figure.titles << title
      end
    end
    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |landmark_id|
        landmark = Landmark.find(landmark_id)
        @figure.landmarks << landmark
      end
    end 
    if params['title']['name'] != nil
      new_title = Title.create(name: params['title']['name'])
      @figure.titles << new_title
    end
    if params['landmark']['name'] != nil
      new_landmark = Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
      @figure.landmarks << new_landmark
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  post '/figures' do
    new_figure = Figure.new(name: params['figure']['name'])

    if params['figure']['title_ids'] != nil 
      params['figure']['title_ids'].each do |title_id|
        new_figure.titles << Title.find(title_id)
      end
    end

    if params['figure']['landmark_ids'] != nil 
      params['figure']['landmark_ids'].each do |landmark_id|
        new_figure.landmarks << Landmark.find(landmark_id)
      end
    end

    if @params['title']['name'] != nil
      new_title = Title.new(name: @params['title']['name'])
      new_title.save
      new_figure.titles << new_title
    end

    if @params['landmark']['name'] != nil
      new_landmark = Landmark.new(name: @params['landmark']['name'])
      new_landmark.save
      new_figure.landmarks << new_landmark
    end
    new_figure.save

    redirect to "figures/#{new_figure.id}"
  end

end




