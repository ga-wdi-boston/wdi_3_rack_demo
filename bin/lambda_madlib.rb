require 'rubygems'
require 'rack'
require 'pry'

# Enter a set of query params into the the browser. For example:
# http://localhost:3000/?who=The Clown Posey&name=Fred Smith&crime=Spitting&source=Belmont Times

# The values in the URL params will be inserted into the string below.
app = lambda do |env|

  # Get all the query value pairs from the URL
  queries = env['QUERY_STRING'].split('&') unless env['QUERY_STRING'].empty?

  qh = { }
  # Build a Hash containing key value pairs from the query string
  queries.each do |entry|
    key, value = entry.split('=')
    qh[key.to_sym] = value
  end


  mad_lib_str = "#{qh.fetch(:who, 'The Police')} arrested #{qh.fetch(:name, 'a white male')} for #{qh.fetch(:crime, 'Jay Walking')} earlier this week, and according to a report by the #{qh.fetch(:source, 'Boston Globe')}, the incident stemmed from a dispute over a #{qh.fetch(:object, 'an old sock')}\n"
  

  [200, {'Content-Type' => 'text/html'}, [mad_lib_str] ]
end

Rack::Handler::WEBrick.run app, Port: 3000

