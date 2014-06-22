
class MyApp
  def call env
    
    # Get the request
    request = Rack::Request.new env
    body = if request['q']
             "query  #{request['q'].inspect}"
           else
             "no query"
           end
    [200, {"Content-Type" => "text/html"}, body ]
  end
end
