class FiguresController < ApplicationController
    get "/figures/new" do
        @titles = Title.all
        @landmarks = Landmark.all
        erb :"figures/new"
    end

    post "/figures" do
        @figure = Figure.find_or_create_by(name: params["figure"]["name"])
       
        if params["title"]["name"] != ""
            @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
        else 
            @figure.title_ids = params["figure"]["title_ids"]
        end

        if params["landmark"]["name"] != ""
            @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
        else 
            @figure.landmark_ids = params["figure"]["landmark_ids"]
        end
        
        
        redirect "/figures/#{@figure.id}"
    end

    get "/figures" do
        @figures = Figure.all
        erb :"figures/index"
    end

    get "/figures/:id" do
        @figure = Figure.find(params[:id])
        erb :"figures/show"
    end

    get "/figures/:id/edit" do
        @figure = Figure.find(params[:id])
        @landmarks = Landmark.all
        @titles = Title.all

        erb :"figures/edit"
    end

    post "/figures/:id" do
        @figure = Figure.find(params[:id])
        @figure.name = params["figure"]["name"]

        if params["title"]["name"] != ""
            @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
        else 
            @figure.title_ids = params["figure"]["title_ids"]
        end

        if params["landmark"]["name"] != ""
            @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
        else 
            @figure.landmark_ids = params["figure"]["landmark_ids"]
        end

        @figure.save
        
        redirect "/figures/#{@figure.id}"
    end

end
