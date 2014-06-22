require 'rubygems'
require 'rack'

Rack::Handler::Thin.run lambda{ |env| [200, { }, "Hello World" ] }
