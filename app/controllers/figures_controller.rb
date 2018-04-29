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
  # binding.pry
  @figure = Figure.new(params[:figure])


  if @figure.landmarks.include?(Landmark.find_by(params[:landmark]))
    @figure.landmark = Landmark.find(params[:landmark])
  else
  @landmark = Landmark.new(params[:landmark])
end
  @figure.landmarks << @landmark


    if @title
      @figure.title_ids << @title.id
    else
   @title = Title.create(params[:title])
   end

   @figure.titles << @title

  @figure.save
  redirect "/figures/#{@figure.id}"
end

get '/figures/:id/edit' do

  @figure = Figure.find(params[:id])
  erb :'/figures/edit'
end

patch '/figures/:id' do
 # binding.pry
  @figure = Figure.find(params[:id])

  @landmark = Landmark.new(params[:landmark])

  @figure.landmarks << @landmark
  @figure.update(params[:figure])
  # binding.pry
  redirect to :"/figures/#{@figure.id}"
end

delete '/figures/:id'  do
        @figure = Figure.find(params[:id])
        @figure.destroy
        redirect '/figures'

      end


end
