class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end
  
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @titles = @figure.titles
    @landmarks = @figure.landmarks
    erb :"/figures/show"
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end
  
  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    
    if !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id.to_i)
      end
    end
    
    if !!params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id.to_i)
      end
    end
    
    if !!params[:title]
      @figure.titles << Title.create(:name => params[:title][:name])
    end
    
    if !!params[:landmark]
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end
    
    @figure.save
    redirect '/figures'
  end
  
  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    
    if !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id.to_i)
      end
    end
    
    if !!params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id.to_i)
      end
    end
    
    if !!params[:title][:name]
      @figure.titles << Title.create(:name => params[:title][:name])
    end
    
    if !!params[:landmark][:name]
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end
    
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
  
end
