#  Simple Rackup using a config.ru file.

## Install the thin web server. 
   gem install 'thin'

##  Simple Rack app using rackup and the thin web server
    config.ru - A very simple rackup that returns "Hello World"
### Running the rackup on port 9292

    <code> rackup config.ru </code>

### Running under thin webserver on port 3000, make sure you have thin installed!
   
   <code> thin --rackup config.ru start   </code>

# Automatic Code Reload (Rack::Reloader)
  This will return dynamic content, content that will change everytime it's requested.

  If you want to see how to view changes made to the app on the
  fly. Need to use Rack::Reloader. This will pull in the Rack::Reloader
  which will allow one to make changes on the fly.

## Rackup file
    auto_reload.ru

## File that defines the MyApp class.
  A Ruby class that is a rack app needs a 'call' method.
  auto_reload_app.rb

## Running the rackup:

  <code> rackup auto_reload.ru -p 3000 </code>

## Running the client:
  <code> curl http://localhost:3000 </code>

# Show Exceptions

  Catch all exceptions and show the stack trace.
## Rack up to load MyApp. This will "use" Rack::ShowExceptions to catch all exceptions. 
 show_exceptions.ru
 
## Ruby rack class that will throw an exception.
   show_exceptions_app.rb

## Run rack app.

   <code> thin --rackup auto_reload.ru start </code>

## Run HTTP Client, curl

   <code> curl http://localhost:3000 </code>

# Using Rack::Request
##  Rackup file 
  rack_request.ru

## Ruby Rack class
   rack_request_app.rb

  Rack::Request instance to look inside the request. And if the request
  has a query parameter it will return the value for it.

## start the rackup
   
   <code> thin --rackup rack_request.ru start </code>

## make the request withOUT a query param

   <code>   curl http://localhost:3000 </code>

   <code> curl http://localhost:3000/?q=foo OR curl http://localhost:3000?q=foo </code>

#  Using Rack::Response
   rack_request.ru - rackup that calls MyApp#call
   rack_request_app.rb - MyApp class that is a rack app. It will create a
   Rack::Response and set the response header 'Content-Type' to
   'text/html' and add HTML to the response body and return.

## Run the rackup

   <code> thin --rackup rack_response.ru start </code>

## In a browser go to  http://localhost:3000 
   Should see the text "Hello World" in bold

## DON'T try to set body directly.
   It doesn't set the CONTENT_LENGTH header.
###  DONT Do this
     response.body = "<b>Hello World</b>"

# How does a rackup, *.ru, work?

  A rackup will basically encapsulate the contents for the *.ru file
  inside a block that is passed to Rack::Builder.

  rack_builder_app.rb - ruby file that mimics how a rackup works.

  NOTE: see Rack::Builder for more functionality.
  EX: The use method is an instance method of Rack::Builder

# Rack Builder
  ruby rack_builder_app.rb 
