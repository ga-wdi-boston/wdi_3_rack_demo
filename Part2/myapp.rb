
class MyApp
  def call env
    request = Rack::Request.new env
    response = Rack::Response.new

    # Set the HTTP Content type header in HTTP Response
    response['Content-Type'] = 'text/html'

    # the write will write to the body AND
    # update the Content-Length in the header of the HTTP Response
    response.write '<h1>Hello World</h1></br>'

    response.finish
  end
end
