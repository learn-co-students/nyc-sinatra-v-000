class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    @figures = Figure.all
    @landmarks = Landmark.all
    erb :'/application/root'
  end

end
