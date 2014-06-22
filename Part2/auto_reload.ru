require './auto_reload_app'

# pull in any changes made at runtime 
use Rack::Reloader

run  MyApp.new

# default port for rackup run on thin is 3000
# thin --rackup auto_reload.ru start
# curl http://localhost:3000
