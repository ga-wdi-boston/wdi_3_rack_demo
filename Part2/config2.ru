# thin --rackup rack_reloader.ru start
require 'myapp'
require 'my_middleware'

use Rack::ShowExceptions
# check if any of the required files have changed, if so reload files.
# kinda like development mode in Rails.
use Rack::Reloader
use MyMiddleware, :x => 'y'

run MyApp.new
