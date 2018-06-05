class TitlesController < ApplicationController

  get '/titles/:id' do
    @title = Title.find_by_id(params[:id])
    erb :'/titles/show'
  end
end