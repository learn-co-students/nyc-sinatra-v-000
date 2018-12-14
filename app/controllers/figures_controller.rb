class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all.sort {|a,b| a.name <=> b.name}
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all.sort {|a,b| a.name <=> b.name}
    @titles = Title.all.sort {|a,b| a.name <=> b.name}
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      new_title = Title.find_or_create_by(name: params[:title][:name])
      if !@figure.titles.include?(new_title)
        @figure.titles << new_title
      end
    end
    if !params[:landmark][:name].empty?
      new_landmark = Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      if !@figure.landmarks.include?(new_landmark)
        @figure.landmarks << new_landmark
      end
    end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @landmarks = Landmark.all.sort {|a,b| a.name <=> b.name}
    @titles = Title.all.sort {|a,b| a.name <=> b.name}
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      new_title = Title.find_or_create_by(name: params[:title][:name])
      if !@figure.titles.include?(new_title)
        @figure.titles << new_title
      end
    end
    if !params[:landmark][:name].empty?
      new_landmark = Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      if !@figure.landmarks.include?(new_landmark)
        @figure.landmarks << new_landmark
      end
    end

    redirect to "/figures/#{@figure.id}"
  end


end
