class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    # raise params.inspect
    # {"figure"=>{"name"=>"New Figure", "title_ids"=>["2"], "landmark_ids"=>["9"]}, "title"=>{"name"=>""}, "landmark"=>{"name"=>""}
    @figure = Figure.create(:figure => params["name"])
    if !params["title"]["name"].empty? || !params["landmark"]["name"].empty?
      @figure.title << Title.create(name: params["title"]["name"]) &&
      @figure.landmark << Title.create(name: params["landmark"]["name"])
      @figure.save
    end

    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    erb :'figures/show'
  end

end
