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
    @figure = Figure.create(name: params[:figure][:name])
    
    @figure.titles << Title.find(params[:figure][:title_ids]) unless !params[:figure][:title_ids]
    @figure.titles << Title.create(name: params[:title][:name]) unless params[:title][:name] == ""
    
    @figure.landmarks << Landmark.find(params[:figure][:landmark_ids]) unless !params[:figure][:landmark_ids]
    @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed]) unless params[:landmark][:name] == ""
    
    @figure.save
    redirect "figures/#{@figure.id}"
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

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])

    @figure.titles.clear
    @figure.titles << Title.find(params[:figure][:title_ids]) unless !params[:figure][:title_ids]
    @figure.titles << Title.create(name: params[:title][:name]) unless params[:title][:name] == ""
    
    @figure.landmarks.clear
    @figure.landmarks << Landmark.find(params[:figure][:landmark_ids]) unless !params[:figure][:landmark_ids]
    @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed]) unless params[:landmark][:name] == ""
    
    @figure.save
    redirect "figures/#{@figure.id}"
  end

end
