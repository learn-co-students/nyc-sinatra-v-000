class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

#<--------------TITLES--------------->
      if !params[:title][:name].empty?
        @figure.titles << Title.create(name: params[:title][:name])
      end

      if !params[:figure][:title_ids].empty?
        params[:figure][:title_ids].each do |title_id|
          @figure.titles << Title.find(title_id)
        end
      end
#<---------------------LANDMARKS------------------->
binding.pry
      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
      end

      if !params[:figure][:landmark_ids].empty?
        params[:figure][:landmark_ids].each do |landmark_id|
          @figure.landmarks << Landmark.find(landmark_id)
        end
      end
      erb :'/figures/show'
  end



end
