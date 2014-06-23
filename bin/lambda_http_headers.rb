require 'rubygems'
require 'rack'

# Show the HTTP Request Headers, contained in the env passed to the
# lambda
app = lambda do |env|
  # HTTP Request Header
  response = []
  response << "Method: #{env['REQUEST_METHOD']}"
  response << "Request URI: #{env['REQUEST_URI']}"
  response << "Query String: #{env['QUERY_STRING']}"
  response << "Request Path: #{env['REQUEST_PATH']}"
  response << "Accept: #{env['HTTP_ACCEPT']}"
  response << "Accept Language: #{env['HTTP_ACCEPT_LANGUAGE']}"
  response << "User Agent: #{env['HTTP_USER_AGENT']}"
  response << "URL Scheme: #{env['rack.url_scheme']}\n"  
  
  [200, { }, [response.join("\n")] ]
end

Rack::Handler::WEBrick.run app, Port: 1234

# ruby labmda_http_headers.rb
# curl -i http://localhost:1234/this/is/my/path?name=tom


# In Chrome Inspector open the Network tab and look at the HTTP Request and Response.

