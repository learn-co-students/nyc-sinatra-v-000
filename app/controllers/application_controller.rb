class ApplicationController < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, proc { File.join(root, '../views/') }

  get '/' do
    erb :"application/index"
  end
end
