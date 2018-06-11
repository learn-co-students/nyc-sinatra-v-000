class LandmarksController < ApplicationController
    get '/landmarks/new' do
        erb :'/landmarks/new'
    end

    post '/landmarks' do
        landmark = Landmark.new
        landmark.name = params[:landmark][:name]
        landmark.year_completed = params[:landmark][:year_completed].to_i
        landmark.save

        redirect to "/landmarks/#{landmark.id}"
    end
end
