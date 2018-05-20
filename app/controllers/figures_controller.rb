class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    puts "Params = #{params}"

    @figure = Figure.create(name: params[:name])
    # # Find or Create new Artist + associate to Song
    # @artist = Artist.find_by_or_create(name: params[:artist_name])
    # @song.artist_id = @artist.id

    # # Create new Song_Genre association
    # if !params["genres"].empty?
    #   SongGenre.all.each do |song_genre|
    #     if song_genre.song_id == @song.id
    #       song_genre.delete
    #     end
    #   end
    #   params["genres"].each do |new_genre|
    #     SongGenre.create(genre_id: new_genre[0], song_id: @song.id)
    #   end
    # end

    @figure.save
    redirect to "/figures/#{@figure.id}"
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
    # puts "Update Action Params = #{params}"
    @figure = Figure.find(params[:id])
    # @artist = Artist.find_by(name: params[:artist_name])
    # @song.update(name: params[:song_name], artist_id: @artist.id)
    # if !params["genres"].empty?
    #   SongGenre.all.each do |song_genre|
    #     if song_genre.song_id == @song.id
    #       song_genre.delete
    #     end
    #   end
    #   params["genres"].each do |new_genre|
    #     SongGenre.create(genre_id: new_genre[0], song_id: @song.id)
    #   end
    # end
    redirect to "/figures/#{@figure.id}"
  end


end

# rspec spec/figures_controller_view_spec.rb

# nyc-sinatra-v-000
