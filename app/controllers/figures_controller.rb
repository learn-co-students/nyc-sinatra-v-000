class FiguresController < ApplicationController
  get '/figures' do
    @figure = Figure.all
    erb :'figures/index' 
  end
  
  get '/figures/new' do 
    erb :'/figures/new'
  end
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end
  
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end
  
  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
      if params[:figure][:title_ids]
         titles = params[:figure][:title_ids]
         titles.each do |title|
             figure.titles << Title.find(title)
         end
     end
     if params[:figure][:landmark_ids]
         landmarks = params[:figure][:landmark_ids]
         landmarks.each do |landmark|
             figure.landmarks << Landmark.find(landmark)
         end
     end
     if !params[:titles][:name].empty?
         title = Title.create(params[:title])
         figure.titles << title
     end
     if !params[:landmark][:name].empty?
         landmark = Landmark.create(params[:landmark])
         figure.landmarks << landmark
     end
     
     @figure.save
     redirect to("/figures/#{@figure.id}")
   end
end
