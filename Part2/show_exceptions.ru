require './show_exceptions_app'

# catch errors from downstream apps
use Rack::ShowExceptions
# pull in any changes made at runtime 
use Rack::Reloader

run  MyApp.new

# default port for rackup run on thin is 3000
# thin --rackup show_exceptions.ru start
# curl http://localhost:3000

