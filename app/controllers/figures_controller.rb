class FiguresController < ApplicationController
  # add controller methods
 get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
 end


  get '/figures/new'  do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures'  do
    #  binding.pry
    #  params with existing data
    #  {"figure"=>{"name"=>"Juan", "title_ids"=>["2"], "landmark_ids"=>["6"]},
    #   "title"=>{"name"=>""},
    #    "Landmark"=>{"name"=>"", "year_completed"=>""}}

           @figure = Figure.create(params[:figure])
           #it let update with  new title or landmark even if you chose some before
           unless params[:landmark][:name].empty?
             @figure.landmarks << Landmark.create(params[:landmark])
           end

          unless params[:title][:name].empty?
              @figure.titles << Title.create(params[:title])
          end
          @figure.save
          redirect "/figures/#{@figure.id}"

  end

 patch '/figures/:id' do
         @figure = Figure.find_by_id(params[:id])

        #  params => {"_method"=>"patch",
        #            "figure"=>  {"name"=>"Meres",
        #                        "title_ids"=>["1", "2", "3", "4"],
        #                         "landmark_ids"=>["10"]},
        #              "id"=>"6"}

       @figure.update(params[:figure])

       unless params[:title][:name].empty?
        @figure.title_ids << Title.create(params[:title])
       end
       unless params[:landmark][:name].empty?
         @figure.landmark_ids << Landmark.create([:landmark])
       end
      @figure.save
      redirect "figures/#{@figure.id}"
   end
end
