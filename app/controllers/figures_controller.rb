class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end


  post '/figures' do

    @figure = Figure.create(name: params[:figure][:name])

      if !params[:title][:name].empty?
        @figure.titles << Title.create(name: params[:title][:name])
      end

      if !params[:figure][:title_ids].nil? && !params[:figure][:title_ids].empty?
        params[:figure][:title_ids].each do |title_id|
          @figure.titles << Title.find(title_id)
        end
      end

      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end


      if !params[:figure][:landmark_ids].nil? && !params[:figure][:landmark_ids].empty?
        #binding.pry
        params[:figure][:landmark_ids].each do |landmark_id|
          @figure.landmarks << Landmark.find(landmark_id)
        end
      end
      @figure.save
      erb :'/figures/show'
  end

  # post '/figures' do
  #       @figure = Figure.create(params["figure"])
  #       if !params[:landmark][:name].empty?
  #         @figure.landmarks << Landmark.create(params[:landmark])
  #       end
  #       if !params[:title][:name].empty?
  #         @figure.titles << Title.create(params[:title])
  #       end
  #
  #       @figure.save
  #       redirect to "/figures/#{@figure.id}"
  #     end
end
