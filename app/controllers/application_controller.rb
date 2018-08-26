class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  enable :sessions
  set    :session_secret, "password"

end
