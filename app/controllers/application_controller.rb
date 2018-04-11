require 'pry'
class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    @all_figures = Figure.all

    erb :'figures/new'
  end

  post '/figures/show' do

    landmark = Landmark.find_by(name: params["landmark"]["name"])
    title = Title.find_by(name: params["title"]["name"])

    figure = Figure.new(name: params["figure"]["name"])
    landmark.figure_id = figure.id
    figure.landmarks << landmark
    figure.titles << title
    figure.save

    # 1) FiguresController allows you to create a new figure with a title
    #  Failure/Error: fill_in :figure_name, :with => "Doctor Who"
    redirect "/figures/#{figure.slug}" #moves to route GET '/figures/name'
  end

  get '/figures/:slug' do

    @figure = Figure.find_by_slug(params["slug"])
    erb :'figures/show'
  end
end
