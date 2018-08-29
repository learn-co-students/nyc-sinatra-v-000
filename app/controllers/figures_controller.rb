class FiguresController < ApplicationController

    get '/figures' do
      @figures = Figure.all
      erb :'/figures/index'
    end
  
    get '/figures/new' do
        @titles = Title.all
        @landmarks = Landmark.all
      erb :'/figures/new'
    end

    post '/figures' do
        @figure = Figure.create(params["figure"])
        @figure.titles << Title.find_or_create_by(params["title"]) if params["title"]["name"].length >0
        @figure.landmarks << Landmark.find_or_create_by(params["landmark"])if params["landmark"]["name"].length >0 
        @figure.save
        @figure
    end

    # get "/figures/#{@figure.id}" do

    #     erb :'/figures/show'
    # end

    get "/figures/:id" do
        @figure = Figure.find_by_id(params[:id])
        erb :'/figures/show'
      end
    get "/figures/:id/edit" do
        @titles = Title.all
        @figure = Figure.find_by_id(params[:id])
        erb :'/figures/edit'
      end

      patch '/figures/:id' do 
        @figure = Figure.find(params[:id])
        @figure.update(params["figure"])
        @landmark = Landmark.find_or_create_by(name: params["landmark"]["name"])
        @figure.landmarks << @landmark
        # if !params["owner"]["name"].empty?
        #   @pet.owner = Owner.create(name: params["owner"]["name"])
        # @pet.save
        # end
        redirect to "figures/#{@figure.id}"
      end
     
      


  
  end