# thin --rackup rack_reloader.ru start
require 'myapp'

# check if any of the required files have changed, if so reload files.
# kinda like development mode in Rails.
use Rack::Reloader

run MyApp.new
