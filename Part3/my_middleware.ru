require 'myapp'
require 'my_middleware'

use Rack::ShowExceptions
use Rack::Reloader

# "use MyMiddleware" is like
# MyMiddleware.new(app, :header => 'CHUNKY', :footer => 'BACON')
use MyMiddleware, :header => 'CHUNKY', :footer => 'BACON'

run  MyApp.new
