class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    #creates a new Figure instance if one for that name doesn't already exist
    @figure = Figure.find_or_create_by(name: params[:figure][:name])

    #if any title checkboxes are selected, each is associated to @figure
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each {|title| @figure.titles << Title.find(title)}
    #if a unique title is entered in the title textfield, a new Title instance is created/associated to @figure
    elsif !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    #if any landmark checkboxes are selected, each is associated to @figure
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each {|landmark| @figure.landmarks << Landmark.find(landmark)}
    #if a unique landmark is entered in the landmark textfield, a new Landmark instance is created/associated to @figure
    elsif !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    redirect to :"/figures/#{@figure.id}"
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
    @figure.update(name: params[:figure][:name])

    #if any checkboxes are selected, figure.titles is cleared and replaced with new selections
    if params[:figure][:title_ids]
      @figure.titles.clear
      params[:figure][:title_ids].each do |title|
          @figure.titles << Title.find(title)
      end
    #if no checkboxes are selected, figure.titles is cleared
    elsif !params[:figure][:title_ids]
      @figure.titles.clear
    end

    #if a unique title is entered into the title textfield, it is associated to @figure
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    #if any checkboxes are selected, figure.landmarks is cleared and replaced with new selections
    if params[:figure][:landmark_ids]
      @figure.landmarks.clear
      params[:figure][:landmark_ids].each do |landmark|
        @figure.landmarks << Landmark.find(landmark)
      end
    #if no checkboxes are selected, figure.landmarks is cleared
    elsif !params[:figure][:landmark_ids]
      @figure.landmarks.clear
    end

    #if a unique landmark is entered into the landmark textfield, a new landmark is created/associated to @figure
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    @figure.save
    redirect to :"/figures/#{@figure.id}"
  end

  delete '/figures/:id/delete' do
    Figure.delete(params[:id])

    redirect to :'/figures'
  end

end
