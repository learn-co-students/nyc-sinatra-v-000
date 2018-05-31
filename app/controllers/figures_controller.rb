class FiguresController < ApplicationController

  get '/figures/new' do
       @figures = Figure.all
       @titles  = Title.all
      erb :'/figures/new'
    end

 # :note type .... rspec spec/models ... TO pass the test by session
end
