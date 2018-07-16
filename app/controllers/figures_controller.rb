class FiguresController < ApplicationController

    get '/figures/new' do
      erb :'figures/new'
    end

    post '/figures' do
      @figure = Figure.new(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.new(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
    end

    get '/figures' do
      erb :'figures/index'
    end

    get '/figures/:id' do
     @figure = Figure.find_by_id(params[:id])

     erb :'/figures/show'
   end

    get '/figures/:id/edit' do
     @figure = Figure.find_by_id(params[:id])

     erb :'/figures/edit'
   end

    patch '/figures/:id' do
     @figure = Figure.find_by_id(params[:id])
     @figure.update(params[:figure])

     if !params[:title][:name].empty?
       @figure.titles << Title.new(name: params[:title][:name])
     end

     if !params[:landmark][:name].empty?
       @figure.landmarks << Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year])
     end

     @figure.save

     redirect to "/figures/#{@figure.id}"
   end
end
