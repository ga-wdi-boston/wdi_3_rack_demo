require 'rubygems'
require 'rack'

puts "Rack Handler's for each HTTP server:"
puts "#{Rack::Handler.constants.join(', ')}"

puts "Lets create a rack app with only a ruby lambda"
app =  lambda{ |env|  [200, { }, ["The time is #{Time.now}"] ] }

# Using the WEBrick HTTP server listening on port 1234
Rack::Handler::WEBrick.run app, Port: 1234

# Using the Thin HTTP server listening on port 1234
# Rack::Handler::Thin.run app

#######################
# On the command line
#######################

# Run this rack app.
# ruby simplest.rb

# Send a HTTP request
# curl http://localhost:1234
