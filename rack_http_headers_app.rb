require 'rack'

class RackHTTPHeadersApp

  # Build a HTML Document that shows the HTTP Request Headers
  def call(env)
    
    # Get the HTTP Request
    request = Rack::Request.new env

    # Build a HTTP Response
    response = Rack::Response.new
    # Set the HTTP Response Content-Type to HTML
    response.header['Content-Type'] = 'text/html'
    
    # https://github.com/rack/rack/blob/master/lib/rack/request.rb
    response.write('<html><head></head><body><h2>HTTP Request Header</h2><ul>')
    
    response.write  "<li> Method: #{request.request_method}</li>"
    response.write  "<li> Request Full Path: #{request.fullpath}</li>"
    response.write  "<li> Request Path: #{request.path_info}</li>"
    response.write  "<li> Query String: #{request.query_string}</li>"
    response.write  "<li> Params: #{request.params}</li>"        
    response.write  "<li> Accept: #{request.accept_encoding}</li>"
    response.write  "<li> User Agent: #{request.user_agent}</li>"
    response.write  "<li> Base URL: #{request.base_url}</li>"
    response.write('</ul></body></html>')

    response.finish
  end
end

# Rack::Handler::WEBrick.run(RackHTTPHeadersApp.new)
Rack::Handler::WEBrick.run(RackHTTPHeadersApp.new, Port: 3000)

# ruby rack_http_headers_app.rb
# curl -i http://localhost:3000/this%20is%20it/but/not%20the%20/end?name=tom

# In a browser goto
# http://localhost:3000/this%20is%20it/but/not%20the%20/end?name=tom

# And open up the Network tab in the Chrome Inspector and look at the HTTP Request and Response


