class FiguresController < ApplicationController

  get '/figures' do
       @figures = Figure.all
       # model name followed by a method
       erb :'/figures/index'
     end

  get '/figure/new' do
       @figures = Figure.all
       @titles  = Title.all
       @landmarks = Landmark.all
      erb :'/figure/new'
    end

 # :note type .... rspec spec/models ... TO pass the test by session


 post '/figure' do
#create a new artist
#need a flash message...

     @figure = Figure.create(name: params[:figure_name])   # This is where we set the name for song/ it want us to pass in an hash.
     @figure.titles << Title.find_or_create_by(params[:title])  # shovel in Title into figure.titles to be used in the views folder
     @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
     @figure.save

   redirect to ("/figure/#{@figure.id}")  # "/figure/[name of newly created figure]
end


 get '/figure/:id' do
      @figure = Figure.find_by_id(params[:id])  # slug helps to find by name instaed of ID
      # model name followed by a method
      erb :'/figure/show'
 end


end
