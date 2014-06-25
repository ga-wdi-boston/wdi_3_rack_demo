
# Simple Rack app to show the current time.
class ShowTime

  def call(env)
    # Rack Wrapper for HTTP Request
    request = Rack::Request.new(env)

    # Rack Wrapper for HTTP Response
    response = Rack::Response.new

    html = "<html><head></head><body><h3>Time is #{Time.now}</h3></body></html>"
    # Set the Response body
    response.write(html)

    # Set the Response Content-Length
    response.finish

  end
end
