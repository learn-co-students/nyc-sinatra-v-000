class FiguresController < ApplicationController



  get '/figures' do
    erb :'/figures/index'
  end

get '/figures/new' do
  erb :'/figures/new'
end

get '/figures/:id' do
  # raise params.inspect
  @figure = Figure.find(params[:id])

  erb :'figures/show'
end



post '/figures/:id/edit' do

  if !@landmark

  @landmark = Landmark.create(params[:landmark])
  @figure.landmarks << @landmark
end
 # if !@title
  @title = Title.create( params[:title])
  @figure.titles << @title
# end
@figure = Figure.update(params[:figure])
  @figure.save
  redirect "/figures/show/#{@figure.id}"
end

post '/figures/show' do
  # using figure[:name] & landmark[:name]
      #{"figure"=>{"name"=>"Prince"}, "landmark"=>{"name"=>"Paisley Park"}, "title"=>{"name"=>"His Purpleness"}}
  @figure = Figure.new(params[:figure])
  @landmark = Landmark.new(params[:landmark])
  @figure.landmarks << @landmark

   if @title
     @figure.title_ids << @title.id
   else
  @title = Title.create(params[:title])
  end

  @figure.titles << @title

  @figure.save

  #  binding.pry
  redirect "/figures/show/#{@figure.id}"
end

get '/figures/:id/edit' do
  #@song = Song.find_by_slug(params[:slug])
  @figure = Figure.find(params[:id])
  erb :'/figures/edit'
end

patch '/figures/show/:id' do
  @figure = Figure.find(params[:id])
  @figure = Figure.update(params[:figure])
  redirect to :"/figures/#{@figure.id}"
end

delete '/figures/:id'  do
        @figure = Figure.find(params[:id])
        @figure.destroy
        redirect '/figures'

      end


end
