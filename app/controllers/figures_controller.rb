class FiguresController < ApplicationController

  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @title=params[:title]
    @title_ids=params[:figure][:title_ids]
    @landmark=params[:landmark]
    @landmark_ids=params[:figure][:landmark_ids]
    @figure=Figure.create(:name => params[:figure][:name])
    binding.pry
    if !@title[:name].empty?
      title=Title.create(:name=>@title[:name])
      @figure.titles << title
    end
    if @title_ids
      @title_ids.each do |title_id|
        title=Title.find(title_id)
        @figure.titles << title
      end
    end
    binding.pry
    if !@landmark[:name].empty?
      landmark=Landmark.create(:name=>@landmark[:name])
      @figure.landmarks << landmark
    end
    binding.pry
    if @landmark_ids
      @landmark_ids.each do |landmark_id|
        landmark=Landmark.find(landmark_id)
        @figure.landmarks << landmark
      end
    end
      @figure.save
      redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure=Figure.find(params[:id])
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :'/figures/show'
  end

  patch '/figures/:id' do
    @figure=Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.save
    binding.pry
    redirect to "/figures/#{@figure.id}"
  end

end
