
class MyApp
  def call env

    request = Rack::Request.new env
    response = Rack::Response.new

    response.header['Content-Type'] = 'text/html'
    response.write "<b>Hello World</b>"
    # DON'T try to set body directly, it doesn't set the
    # CONTENT_LENGTH header
    #response.body = "<b>Hello World</b>"
    response.finish

  end
end
