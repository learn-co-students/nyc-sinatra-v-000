require 'pry'
class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures/show' do

    figure = Figure.new(name: params["figure"]["name"])
    figure.save

    # 1) FiguresController allows you to create a new figure with a title
    #  Failure/Error: fill_in :figure_name, :with => "Doctor Who"
    redirect "/figures/show" #moves to route GET '/figures/name'
  end

  get '/figures/show' do
    erb :'figures/show'
  end
end
