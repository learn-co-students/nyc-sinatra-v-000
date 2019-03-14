class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @land = Landmark.find_or_create_by(params[:landmark])
    erb :"/landmarks/#{@land.id}"
  end

# {"landmark"=>{"name"=>"Arc de Triomphe", "year_completed"=>"1806"}}

end
