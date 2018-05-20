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

  post '/figures' do
    # puts "Params = #{params}"
    figure_params = params["figure"]
    title_params = params["title"]
    landmark_params = params["landmark"]
    # puts "FigureP = #{figure_params} || TitleP = #{title_params} || LandmarkP = #{landmark_params}"

    @figure = Figure.create(name: figure_params[:name])
    # puts "figure = #{@figure.name}"
    # puts "Current titles : #{@figure.titles.count}"
    # puts "Current landmarks : #{@figure.landmarks.count}"

    # Find Titles and add to Figure's titles
    # puts "figure_params[:title_ids] : #{figure_params["title_ids"]}"
    if figure_params.has_key?(:title_ids) && !figure_params[:title_ids].empty?
      figure_params["title_ids"].each { |id| @figure.titles << Title.find(id) }
      # puts "Add titles : #{@figure.titles.count}"
    end

    # Create new Title
    if !title_params.empty?
      @title = Title.create(name: title_params[:name])
      @figure.titles << @title
      # puts "Create title : #{@title.name} || Count : #{@figure.titles.count}"
    end

    # Find Landmarks and add to Figure's landmarks
    # puts "figure_params[:landmark_ids] : #{figure_params["landmark_ids"]}"
    if figure_params.has_key?(:landmark_ids) && !figure_params[:landmark_ids].empty?
      figure_params["landmark_ids"].each { |id| @figure.landmarks << Landmark.find(id) }
      # puts "Add landmarks : #{@figure.landmarks.count}"
    end

    # Create new Landmark
    if !landmark_params.empty?
      @landmark = Landmark.create(name: landmark_params[:name], year_completed: landmark_params[:year_completed])
      @figure.landmarks << @landmark
      # puts "Create landmark : #{@landmark.name} || Count : #{@figure.landmarks.count}"
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])

    figure_params = params["figure"]
    title_params = params["title"]
    landmark_params = params["landmark"]

    @figure.update(name: figure_params[:name])

    # Find Titles and add to Figure's titles
    if figure_params.has_key?(:title_ids) && !figure_params[:title_ids].empty?
      figure_params["title_ids"].each { |id| @figure.titles << Title.find(id) }
    end

    # Create new Title
    if !title_params.empty?
      @title = Title.create(name: title_params[:name])
      @figure.titles << @title
    end

    # Find Landmarks and add to Figure's landmarks
    if figure_params.has_key?(:landmark_ids) && !figure_params[:landmark_ids].empty?
      figure_params["landmark_ids"].each { |id| @figure.landmarks << Landmark.find(id) }
    end

    # Create new Landmark
    if !landmark_params.empty?
      @landmark = Landmark.create(name: landmark_params[:name], year_completed: landmark_params[:year_completed])
      @figure.landmarks << @landmark
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end


end

# rspec spec/figures_controller_view_spec.rb

# nyc-sinatra-v-000
