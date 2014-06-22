class MyMiddleware

  def initialize app, options = {}
    @app = app
    puts "app = #{@app.inspect}, options = #{options.inspect} "
  end

  def call env
    status, headers, body = @app.call(env)
    new_body = "CHUNKY"
    body.each{ |str| new_body << str }
    new_body += "BACON"
    headers['Content-Length'] = new_body.length.to_s
    [status , headers, new_body]
  end
  
end
