
class MyMiddleware
  def initialize(app, options = { })
    options[:header] ||= 'foo'
    options[:footer] ||= 'bar'
    
    @app = app
    puts "app => #{app}, options => #{options.inspect}"
    @options = options
  end

  def call(env)
    # call the inner app, app that we're wrapping
    status, headers, body = @app.call(env)
    # wrap the body returned from the inner app in CHUNKY ...
    
    # OOPS, what if inner app doesn't return a string? It returns an
    # object?
    #body = "CHUNKY #{body} BACON"

    new_body = "#{@options[:header]} "
    body.each{ |str| new_body << str}
    new_body += " #{@options[:footer]}"
    
    # add this to update the Content-Length after adding "CHUNKY ... BACON"    
    headers['Content-Length'] = new_body.length.to_s
    
    [status, headers, new_body ]
  end
end
