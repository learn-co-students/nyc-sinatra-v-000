class ApplicationController < Sinatra::Base
  configure do 
    use Rack::MethodOverride
    set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }
    register Sinatra::Twitter::Bootstrap::Assets
  end 
  
  get "/" do 
    erb :'application/root'
  end 

end
