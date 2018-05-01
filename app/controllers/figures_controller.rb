class FiguresController <ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    #Add new landmarks
    if !params[:landmark][:name].empty?
     @figure.landmarks << Landmark.create(params[:landmark])
    end
    #Add new titles
    if !params[:title][:name].empty?
     @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    #Edit titles
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])
    end
    #Edit landmarks
    if !params[:landmark][:name].empty?
     @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
# it "allows you to edit a single figure" do
#   @original_figure = Figure.first
#   visit "/figures/#{@original_figure.id}/edit"
#   fill_in :figure_name, with: "Missy"
#   fill_in :new_landmark, with: "Big Tower"
#   click_button "Edit Figure"
