class LandmarksController < ApplicationController
    get "/landmarks/new" do
        erb :"landmarks/new"
    end

    get "/landmarks/:id" do
        @landmark = Landmark.find(params[:id])

        erb :"landmarks/show"
    end

    get "/landmarks/:id/edit" do
        @landmark = Landmark.find(params[:id])

        erb :"landmarks/edit"
    end

    get "/landmarks" do
        @landmarks = Landmark.all
        erb :"landmarks/index"
    end

    post "/landmarks" do
        landmark_details = params["landmark"]
        @landmark = Landmark.create(landmark_details)

        redirect "/landmarks/#{@landmark.id}"
    end

    post "/landmarks/:id" do
        landmark_details = params["landmark"]
        @landmark = Landmark.find(params[:id])
        @landmark.update(landmark_details)

        redirect "/landmarks/#{@landmark.id}"
    end
end
