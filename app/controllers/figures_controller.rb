class FiguresController < ApplicationController

  get '/figures' do
       @figures = Figure.all
       # model name followed by a method
       erb :'/figures/index'
     end

  get '/figures/new' do
       @figures = Figure.all
       @titles  = Title.all
       @landmarks = Landmark.all
      erb :'/figure/new'
    end

 # :note type .... rspec spec/models ... TO pass the test by session


 post '/figures' do
#create a new artist
#need a flash message...
binding.pry

     @figure = Figure.create(name: params[:Name])   # This is where we set the name for song/ it want us to pass in an hash.
     @figure.title = Title.find_or_create_by(name: params["Artist Name"])

     @figure.genre_ids = params["genres"]
     @figure.savefigure

   redirect to ("/figures/#{@figure.id}")  # "/songs/that-one-with-the-guitar"
end


 get '/figure/:id' do
      @figure = Figure.find_by_id(params[:id])  # slug helps to find by name instaed of ID
      # model name followed by a method
      erb :'/figures/show'
 end


end
