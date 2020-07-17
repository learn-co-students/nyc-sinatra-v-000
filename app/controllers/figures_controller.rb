class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
     erb :"figures/index"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  post '/figures' do
   @figure = Figure.create(params[:figure])
   if params[:title][:name] != ""
    @figure.titles << Title.create(params[:title])
   end
   if params[:landmark][:name] != ""
    @figure.landmarks << Landmark.create(params[:landmark])
   end
   redirect ("/figures/#{@figure.id}")
  end


   get '/figures/:id/edit' do
     @figure = Figure.find_by_id(params[:id])
     erb :"figures/edit"
   end

   patch '/figures/:id' do
     @figure = Figure.find_by_id(params[:id])

     if params[:title][:name] != ""
      @figure.titles << Title.create(params[:title])
     end
     if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
     end
     @figure.update(params[:figure])
     @figure.save
     redirect  ("/figures/#{@figure.id}")
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
