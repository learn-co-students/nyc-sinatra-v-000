class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks= Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params["figure"]["name"], :title_ids => params["figure"]["title_ids"], :landmark_ids => params["figure"]["landmark_ids"])
     if !params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])
     end
     if !params[:landmark][:name].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end
     @figure.save
   end

  get '/figures/:id' do
    @figure = Figure.all.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.all.find_by_id(params[:id])
    erb :'/figures/edit'


  end

  patch '/figures/:id' do
    @figure = Figure.all.find_by_id(params[:id])
    @figure.update(params[:figure])
    if !params[:figure][:name].empty?
      @figure.name.update(params[:figure][:name])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save

    redirect "/figures/#{@figure.id}"

  end



end
