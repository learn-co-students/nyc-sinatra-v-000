$LOAD_PATH.unshift '.'
require 'config/environment'

use Rack::Static, urls: ['/css'], root: 'public' # Rack fix allows seeing the css folder.

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

class Sinatra::Base
  set :show_exceptions => false

  error { |err|
    Rack::Response.new(
      [{'error' => err.message}.to_json],
      500,
      {'Content-type' => 'application/json'}
    ).finish
  }
end

use Rack::MethodOverride

use FiguresController
use LandmarksController
run ApplicationController
