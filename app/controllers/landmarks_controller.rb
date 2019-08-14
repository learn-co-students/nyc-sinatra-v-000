class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(:name => params[:landmark][:name],
      :year_completed => params[:landmark][:year_completed])

    # if params[:figure][:title_ids] != nil
    #   params[:figure][:title_ids].each do |title_id|
    #     @figure.titles << Title.find(title_id)
    #     @figure.save
    #   end
    # end
    #
    # if params[:figure][:landmark_ids] != nil
    #   params[:figure][:landmark_ids].each do |landmark_id|
    #     existing_landmark = Landmark.find(landmark_id)
    #     @figure.landmarks << existing_landmark
    #     existing_landmark.figure_id = @figure.id
    #     existing_landmark.save
    #     @figure.save
    #   end
    # end
    #
    # if params[:title][:name] != nil
    #   @figure.titles << Title.create(:name => params[:title][:name])
    #   @figure.save
    # end
    #
    # if params[:landmark][:name] != nil
    #   @figure.landmarks << Landmark.create(:name => params[:landmark][:name],
    #     :figure_id => @figure.id)
    #   @figure.save
    # end

    redirect to '/landmarks'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
   @landmark = Landmark.find(params[:id])
   erb :'/landmarks/edit'
 end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(:name => params[:landmark][:name],
      :year_completed => params[:landmark][:year_completed])
    # @figure.titles = params[:title][:name]
    # @figure.landmarks = params[:landmark][:name]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end
