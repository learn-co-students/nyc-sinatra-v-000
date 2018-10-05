class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
     erb :index
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
      #binding.pry
    @figure = Figure.create(params[:figure])
  


  end




end


#post '/songs' do
  #  @song = Song.create(:name => params["Name"])
  #  @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
  #  @song.genre_ids = params[:genres]
  #  @song.save


#{"figure"=>{"name"=>"Doctor Who", "title_ids"=>["231"]},
#   "landmark"=>{"name"=>""},
#   "title"=>{"name"=>""},
#   "Create New Figure"=>"submit"}
