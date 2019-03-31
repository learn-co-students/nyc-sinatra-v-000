class FiguresController < ApplicationController
  # add controller methods
  get "/figures" do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/new" do
    erb :'/figures/new'
  end

  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  post "/figures" do
    @figure = Figure.create(params[:figure]) #no if else needed because there is no checklist for figure.
    #New and Edit work on a singular figure.
    #Failure/Error: check "title_#{Title.first.id}" means change input id to include erb tags to implement ruby


    #if !params[:title].empty? && !Title.find_by(name: params["title"]["name"])

    #  @title = Title.create(params[:title])
    #  @title.save
    if !(params[:title][:name].empty?) #&& !(Title.find_by(id: params["figure"]["title_ids"][])) #parenthesis helps alot
      @title = Title.create(params[:title])
      @figure.titles << @title #many to many, more than one title
      @figure.save
    #elsif Title.find_by(id: params["figure"]["title_ids"].first)
    #  params["figure"]["title_ids"].each do |id|
    #    @title = Title.find_by(id: id)
    #    @figure.titles << @title #many to many, more than one title
    #    @figure.save
    #  end
    else
    end
    #extra else stuff not needed for title
    if !(params[:landmark].empty?) #&& !(Landmark.find_by(name: params["figure"]["landmark_ids"][])) # || !Landmark.find_by(year_completed: params["landmark"]["year_completed"])
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
      @figure.save
  #  elsif params["figure"]["landmark_ids"].empty?
  #   params["figure"]["landmark_ids"].each do |id|
  #     @landmark = Landmark.find_by(id: id)
  #     @figure.landmarks << @landmark
  #     @figure.save
  #   end
  #  else
    end
    redirect to("/figures/#{@figure.id}")
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/edit"
  end

  patch "/figures/:id" do
    redirect to("/figures/#{@figure.id}")
  end
end
