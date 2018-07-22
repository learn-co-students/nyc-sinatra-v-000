class ApplicationController < Sinatra::Base

  register Sinatra::Twitter::Bootstrap::Assets
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
    erb :'application/root'
  end
end
