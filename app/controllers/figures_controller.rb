require 'pry'
class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])

    if !params[:figure][:title_ids] == nil
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id)
        @figure.save
      end
    end

    if !params[:figure][:landmark_ids] == nil
      params[:figure][:landmark_ids].each do |landmark_id|
        existing_landmark = Landmark.find(landmark_id)
        @figure.landmarks << existing_landmark
        existing_landmark.figure_id = @figure.id
        existing_landmark.save
        @figure.save
      end
    end

    binding.pry 
    if !params[:title][:name] == nil
      @figure.titles << Title.create(:name => params[:title][:name])
      @figure.save
    end


    @figure.landmarks << Landmark.create(:name => params[:landmark][:name],
        :figure_id => @figure.id)
    @figure.save

    erb :'/figures/show'
  end

end

# [1] pry(#<FiguresController>)> params
# ***new figure with existing title
# => {"figure"=>
#   {"name"=>"Doctor Who", "title_ids"=>["1085"]},
#  "title"=>{"name"=>""},
#  "landmark"=>{"name"=>""},
#  "new_landmark_year"=>""}
#
# ***new figure with existing landmark
#  {"figure"=>
#   {"name"=>"Doctor Who", "landmark_ids"=>["1517"]},
#  "title"=>{"name"=>""},
#  "landmark"=>{"name"=>""},
#  "new_landmark_year"=>""}
#
# ***new figure with new title
#  > {"figure"=>{"name"=>"Doctor Who"},
#  "title"=>{"name"=>"Time Lord"},
#  "landmark"=>{"name"=>""},
#  "new_landmark_year"=>""}
#
# ***new figure with new landmark
#  {"figure"=>{"name"=>"Doctor Who"},
#  "title"=>{"name"=>""},
#  "landmark"=>{"name"=>"The Tardis"},
#  "new_landmark_year"=>""}
