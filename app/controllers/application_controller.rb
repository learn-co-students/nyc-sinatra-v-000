class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end


  get    
  end



  post
  end



  get
  end


  get
  end



  patch
  end


  put
  end


  delete
  end


end
