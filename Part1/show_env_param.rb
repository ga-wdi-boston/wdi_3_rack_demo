require 'rubygems'
require 'rack'

# Return the contents of the env passed to this rack app.
app = lambda{ |env| [200, { }, env.inspect] }

Rack::Handler::Thin.run app, :Port => 1234

# ruby show_env_param.rb
# curl http://localhost:1234

