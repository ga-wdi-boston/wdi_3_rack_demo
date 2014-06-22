
----

my_middleware.ru - rackup to call MyApp and use the MyMiddeware middleware.
myapp.rb - Rack endpoint that just returns "<b>Hello World</b>"
my_middleware.rb - Rack middleware that wraps the body returned for myapp in the text "CHUNKY ... BACON"

rackup my_middleware.ru -p 3000
curl http://localhost:3000

PROBLEM: 
The text returned is getting truncated, 
CHUNKY <b>Hello Wo

This is because in the my_middeware.rb the Content-Length is not gettting updated with the actuall size of the response body.

FIX:
    new_body += ' BACON'
    # add this to update the Content-Length after adding "CHUNKY ... BACON"
    headers['Content-Length'] = new_body.length.to_s    


----
Create a Sinatra app

sinatra-app.rb - A very simple sinatra app

Use the middleware that I created above in a Sinatra app. This will prepend "Sinatra" and append " Rocks" to the output from the sinatra app, sinatra-app.rb.

ruby sinatra-app.rb 
curl http://localhost:4567
"Sinatra  hello from sinatra  Rocks"

----
How to use Rack Middleware in a Rails app.

NOT DONE YET!!! Another day.