class ApplicationController < Sinatra::Base
  configure do 
    use Rack::MethodOverride
    set :views, Proc.new { File.join(root, "../views/") }
    register Sinatra::Twitter::Bootstrap::Assets
  end 
  
  get "/" do 
    erb :'application/root'
  end 

end
