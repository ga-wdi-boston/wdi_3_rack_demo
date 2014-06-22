class MyApp
  def call env
    request = Rack::Request.new env
    response = Rack::Response.new

    response['Content-Type'] = 'text/html'
    # remember to use write method and not body.
    # body doesn't set the content length header
    response.write "<b>Hello World</b>"
    response.finish
  end
end
