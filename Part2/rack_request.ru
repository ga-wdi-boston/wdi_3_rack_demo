require './rack_request_app'

# catch errors from downstream apps
use Rack::ShowExceptions
# pull in any changes made at runtime 
use Rack::Reloader


run  MyApp.new

# default port for rackup run on thin is 3000
# curl http://localhost:3000
# thin --rackup rack_request.ru start
