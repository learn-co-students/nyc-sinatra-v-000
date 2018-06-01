class FiguresController < ApplicationController

  get '/figures' do
       @figures = Figure.all
       # model name followed by a method
       erb :'/figures/index'
     end

  get '/figures/new' do
       @figures = Figure.all
       @titles  = Title.all
       @landmarks = Landmark.all
      erb :'/figure/new'
    end


 # :note type .... rspec spec/models ... TO pass the test by session
end
