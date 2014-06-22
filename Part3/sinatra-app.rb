require 'rubygems'
require 'sinatra'
require 'my_middleware'

use MyMiddleware, :header => "Sinatra ", :footer => " Rocks"

# some other middleware you may want to use.
#use Rack::Cache
#use Rack::ShowExceptions
#use Rack::Auth::Basic
#use Rack::Session::Cookies

get "/" do
  "hello from sinatra"
end

# ruby sinatra-app.rb 
# curl http://localhost:4567
