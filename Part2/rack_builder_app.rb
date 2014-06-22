require 'rubygems'
require 'rack'

app = Rack::Builder.new {
  require 'rack_response_app'
  
  # use is an instance method of Rack::Builder
  use Rack::ShowExceptions
  use Rack::Reloader

  run MyApp.new
}

Rack::Handler::Thin.run app, :Port => 3000
