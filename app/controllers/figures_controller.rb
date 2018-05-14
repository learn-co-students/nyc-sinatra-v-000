class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
   end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    @title = Title.find_by(:name => params[:figure][:title_ids])
    @landmark = Landmark.find_by(:name => params[:figure][:landmark_ids])

     if @title.nil? #can use find_or_create_by !!!!???
       @figure.titles << Title.create(:name => params[:title][:name])
     else
       @figure.titles << @title unless @figure.titles.include?(@title)
     end

     if @landmark.nil?
       @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
     else
       @figure.landmarks << @landmark unless @figure.landmarks.include?(@landmark)
     end

     @figure.save
     redirect to "/figures/#{@figure.id}" #for redirecting to another route
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do #edits the figure after filling out edit form
    @figure = Figure.find(:name => params[:id]) #update name
    @title = Title.find_by(:name => params[:figure][:title_ids])
    @landmark = Landmark.find_by(:name => params[:figure][:landmark_ids])

     if @title.nil? #can use find_or_create_by !!!!???
       @figure.titles << Title.create(:name => params[:title][:name])
     else
       @figure.titles << @title unless @figure.titles.include?(@title)
     end

     if @landmark.nil?
       @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
     else
       @figure.landmarks << @landmark unless @figure.landmarks.include?(@landmark)
     end

     @figure.save
     redirect to "/figures/#{@figure.id}" #for redirecting to another route
  end

end
