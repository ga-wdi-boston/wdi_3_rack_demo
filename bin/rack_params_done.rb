require 'pry'
require 'rack'

module GA
  class HTTPParams

    # Given a string that represent the URL parameters return a Hash
    # of these name-value pairs.
    def params(url_params)
      pairs = url_params.split('&')
      params_hash = { }
      pairs.each do |entry|
        key, value = entry.split('=')
        params_hash[key.to_sym] = value
      end
      params_hash
    end

    def call(env)
      request = Rack::Request.new(env)
      response = Rack::Response.new

      # Set the HTTP Response Content-Type to Plain text
      response.header['Content-Type'] = 'text/plain'
      
      response.write(self.params(request.query_string).inspect)
      response.finish
    end

  end
end

Rack::Handler::WEBrick.run(GA::HTTPParams.new, Port: 3000)

# ruby bin/rack_params.rb
# curl -i http://localhost:3000/?name=tom&age=57&city=Groton&state=MA

# In a browser goto
# http://localhost:3000/this%20is%20it/but/not%20the%20/end?name=tom

# And open up the Network tab in the Chrome Inspector and look at the HTTP Request and Response
