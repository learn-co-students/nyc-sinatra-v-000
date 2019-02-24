class ApplicationController < Sinatra::Base
    set :sessions_secret, "my_application_secret"
    set :views, proc { File.join(root, '../views/') }
    register Sinatra::Twitter::Bootstrap::Assets

    enable :sessions


    get '/' do
        erb :"application/index"
    end
end
