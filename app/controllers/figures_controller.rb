class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.find_or_create_by(params[:figure])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    
    @figure.save
    redirect '/figures/#{@figure.slug}'
  end
  
#   {"figure"=>{"name"=>"cat", "title_ids"=>["1"], "landmark_ids"=>["19"]},
# "title"=>{"name"=>""},
# "landmark"=>{"name"=>"", "year"=>""}}
  
  
  
  

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/show'
  end

  get '/figures/:slug/edit' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/edit'
  end

  patch '/figures/:slug' do
    
  end

end
