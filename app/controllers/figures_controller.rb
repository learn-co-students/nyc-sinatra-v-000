class FiguresController < ApplicationController

  get '/figures' do
       @figures = Figure.all
       # model name followed by a method
       erb :'/figures/index'
     end

  get '/figures/new' do
       @titles  = Title.all
       @landmarks = Landmark.all
      erb :'/figures/new'
    end

 # :note type .... rspec spec/models ... TO pass the test by session


 post '/figures' do
     @figure = Figure.create(params[:figure])   # This is where we set the name for song/ it want us to pass in an hash.
        if !params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])  # shovel in Title into figure.titles to be used in the views folder
       end

        if !params[:landmark][:name].empty?
          @figure.landmarks << Landmark.create(params[:landmark])
        end

     @figure.save

   redirect to ("/figures/#{@figure.id}")  # "/figure/[name of newly created figure]
end

 get '/figures/:id' do
      @figure = Figure.find_by_id(params[:id])
      # model name followed by a method
      erb :'/figures/show'
 end

   get '/figures/:id/edit' do
       @figure = Figure.find(params[:id])
      #  slug helps to find by name instaed of ID
       erb :'figures/edit'
    end

 patch '/figures/:id' do
        @figure = Figure.find_by_id(params[:id])
        @figure.update(params[:figure])
        @figure.titles = Titles.find_or_create_by(name: params[:titles][:name])
        @figure.landmarks.ids = params[:landmark]
        @figure.save

        #  flash[:message] = "Successfully updated song."
        # redirect to("/songs/#{@song.slug}")

          # end

      end

end
