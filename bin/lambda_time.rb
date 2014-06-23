require 'rubygems'
require 'rack'

# All we need is a Ruby lambda.
# env - Ruby Hash that contains the HTTP Request Header Info
# 200 - HTTP Response status code, "OK".
# { 'Content-Type' => 'text/plain' } - HTTP Response Headers.
# [...] - HTTP Response body
app =  lambda{ |env|  [200, { }, ["The time is #{Time.now}"] ] }

# Using the WEBrick HTTP server listening on port 1234
Rack::Handler::WEBrick.run app, Port: 1234

# Run this rack app.
# ruby bin/lambda_http.rb

# Send a HTTP request
# curl http://localhost:1234
