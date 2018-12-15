require 'bundler/setup'
Bundler.require

ENV["SINATRA_ENV"] ||= "development"

configure :development do
  set :database, 'sqlite3:db/nycdevelopment.sqlite'
end

configure :test do
  set :database, 'sqlite3:db/nyctest.sqlite'
end



require_relative "../app/controllers/application_controller.rb"

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].sort.each {|f| require f}
