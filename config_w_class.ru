#\ -p 3000
# Above will Run this rackup on port 3000

# Require the class that will be invoked.
require_relative './lib/show_time'

# Run the Rack app.
run ShowTime.new

