class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do

    erb :'figures/index'
  end

  post '/figures' do
    # Worked with Matthew and looked at student and main solutions and finally determined the issue.
    # For the test with landmarks, title isn't passed and landmark is.
    # Since I was trying to create my code to create individual work with titles and landmarks, rather than
    # creating via the params hash, it failed. I hadn't had success, nor any tests failed me, on
    # creating without the hash in other labs, so I was doing it the longer way all the time,
    # especially because in earliers labs, my hashes had extra "junk" in them I could never figure out
    # how it got there or why. Not creating the figure via the params hash so meant that the associations
    # were not being made as expected. LESSON LEARNED!!
    figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end

    figure.save
    redirect "/figures/#{figure.id}"
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  get '/figures/:id' do
      @figure = Figure.find(params[:id])

      erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :'figures/edit'
  end

  # Remember to pass back the id in the URL for put/patch
  # so it is available for use
  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]

    if !params[:landmark].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end

    figure.save
    redirect "/figures/#{figure.id}"
  end

end
