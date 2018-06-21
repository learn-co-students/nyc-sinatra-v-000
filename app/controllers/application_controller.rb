class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures' do
    @figures = Figure.all

    erb :"figures/index"
  end

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :"landmarks/index"
  end
end
