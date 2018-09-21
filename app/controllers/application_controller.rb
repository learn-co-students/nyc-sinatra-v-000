class ApplicationController < Sinatra::Base
  # Comment
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
end
