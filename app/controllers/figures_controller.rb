require 'pry'
class FiguresController < ApplicationController
 get '/figures' do
   @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    erb :'/figures/new'
  end
  
   get '/figures/:id' do
      @figures = Figure.find(params[:id])
      erb :'figures/show'
   end

    get '/figures/:id/edit' do
      @figures = Figure.find(params[:id])
      erb :'figures/edit'
    end
  
    post '/figures' do 
      @figures = Figure.create(params['figure'])
         if !params[:title][:name].empty? 
          @figures.titles << Title.create(params[:name])
         else !params[:landmark][:name].empty? 
         @figures.landmarks << Landmark.create(params[:landmark])
      end
      @figures.save
      erb :'/figures/show'
    end
   
    patch '/figures/:id' do
      @figures = Figure.find(params[:id])
      @figures.update(params[:figure])
      if !params[:title][:name].empty? 
          @figures.title << Title.create(params[:name])
         else !params[:landmark][:name].empty? 
         @figures.landmark << Landmark.create(params[:landmark])
      end
      @figures.save
        redirect "figures/#{@figures.id}"
      end
  
end
