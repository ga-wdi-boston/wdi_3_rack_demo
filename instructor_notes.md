## Rack 

[Rack](http://rack.github.io/) provides a minimal interface between webservers supporting Ruby and Ruby frameworks.  

[Quick Intro to Rack](http://rubylearning.com/blog/a-quick-introduction-to-rack/)

### Demo

#### Show the simplest Rack app possible.  
Will show the current time.

This application, _a simple Ruby lambda_ , is passed an environment Ruby hash that contains the HTTP Request Header.

This app will return an array with three entries:  
1. A HTTP Status Code, 200 is the code for OK.  
2. A Ruby hash that contains the HTTP Response Header.  
3. Any Object that responds to the 'each' method.  __This will be the body of the page you will see in the browser__


##### Run the Rack app.
 
```
ruby lambda_time.rb
```

##### Send a HTTP Request with curl.  
```
curl -i http://localhost:1234/this/is/my/path?name=jack&age=33
```

##### Send a HTTP Request with Chrome.  

http://localhost:1234/this%20is%20it/but/not%20the%20/end?name=jack&age=33

Open the Chrome Inspector and go to the Network tab. Refresh and look at the HTTP Request/Response.

### Lab

Break up into groups of three and answer all of the below questions:

1. What is a RFC and how does it apply to HTTP?
2. What are the HTTP methods and what/when are they used?
3. What are the HTTP status codes and how are they grouped?
4. What is the Accept HTTP Header used for? 
5. What are media types and which of these are used for HTML, JSON and plain text?
6. What is the Content-Type header?
7. Where do above HTTP status and Headers live? In the Request or Response?

## Demo
#### Show the HTTP Request Headers

The lambda is passed an enviroment Hash built from the HTTP Request. Here we return a couple of entries in the environment hash.

```
ruby lambda_http_headers.rb
```

```
curl -i http://localhost:1234/this/is/my/path?name=jack&age=33
```

In Chrome, Safari, Firefox, etc.  
http://localhost:1234/this%20is%20it/but/not%20the%20/end?name=jack&age=33

### Lab
Write a simple Rack app that will fill in the blanks in the below text from URL params. The filled in text will be returned by the HTTP Response. The word in __bold__ are going to be replaced by URL params.

"__Who__ arrested __name__ for __crime__ earlier this week, and according to a report by the __source__, the incident stemmed from a dispute over a __object__."

Example:  
"__Police__ arrested __a Main Street resident__ for __illegal possession of a handgun and ammunition__ earlier this week, and according to a report __in the Lowell Sun__, the incident stemmed from a dispute over a __frozen cheese pizza__."

http://localhost:1234/?who=The Police&name=a Main Street resident&crime=possesion of a handgun&source=in the Lowell Sun&object=frozen cheess pizza


##### Question what are the %20 in the response?

### Demo

#### Same as above but use a Ruby class.

Just add a call method to a Ruby class to make it a Rack app! 

The call method takes one argument, the enviroment Hash built from the HTTP Request.

This uses a convenvience class, [Rack::Request](https://github.com/rack/rack/blob/master/lib/rack/request.rb), provided by Rack. It gives one access to 
the HTTP Request.

And it uses a class, Rack::Response , provided by Rack. 
This can be used to build a HTTP Response.

Notice the Rack::Request#params method. Take a look at the ruby code for this params method. It just converts the query string 'name=jack&age=33' to {'name' => 'jack', 'age=33'}.

```
ruby bin/http_headers_app.rb
```

```
curl -i http://localhost:3000/this%20is%20it/but/not%20the%20/end?name=tom
```

Enter this URL into Chrome and open the Chrome debugger.


### Lab
Write our own Rack app, bin/rack_params.rb, and implement a _params_ method that will turn the URL params in the HTTP Request into a hash. 

Show this hash in the HTTP Response body.


Enter this in Chrome:  
```
http://localhost:3000/?name=tom&age=57&city=Groton&state=MA
```

To get:  
```
{:name=>"tom", :age=>"57", :city=>"Groton", :state=>"MA"}
```

## Demo 

Let's create a _rackup_. 


"rackup is a useful tool for running Rack applications. rackup automatically figures out the environment it is run in, and runs your application as FastCGI, CGI, or standalone with Mongrel or WEBrick – all from the same configuration.

To use rackup, you’ll need to supply it with a rackup config file. By convention, you should use .ru extension for a rackup config file. Supply it a run RackObject and you’re ready to go:

By default, rackup will start a server on port 9292." [Rack Tutorial](http://rubylearning.com/blog/a-quick-introduction-to-rack/#C7)

Take a look at config.ru. Simple rack app that is run by rackup.


```
rackup config.ru
```



                                                                      
