ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


task :configure_routes do
  require "sinatra-rake-routes"
  # Tell SinatraRakeRoutes what your Sinatra::Base application class is called:
  require './my_app'
  SinatraRakeRoutes.set_app_class(MyApp)
end
require "sinatra-rake-routes/tasks"

# Type `rake -T` on your command line to see the available rake tasks.
