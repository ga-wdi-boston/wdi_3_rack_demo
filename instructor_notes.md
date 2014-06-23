## Rack 

[Rack](http://rack.github.io/) provides a minimal interface between webservers supporting Ruby and Ruby frameworks.  

[Quick Intro to Rack](http://rubylearning.com/blog/a-quick-introduction-to-rack/)

### Demo

#### Show the simplest Rack app possible.  
Will show the current time.
 
```
ruby lambda_time.rb
```

#### Show the HTTP Request Headers

The lambda is passed an enviroment Hash built from the HTTP Request. Here we 
return a couple of entries in the environment hash.

```
ruby lambda_http_headers.rb
```

```
curl -i http://localhost:1234/this/is/my/path?name=jack&age=33
```

In Chrome, Safari, Firefox, etc.  
http://localhost:1234/this%20is%20it/but/not%20the%20/end?name=jack&age=33

### Lab
Write a simple Rack app that will fill in the blanks in the below text from URL params. The filled in text will be returned by the HTTP Response.

"_Who_ arrested _name_ for _crime_ earlier this week, and according to a report by the _source_, the incident stemmed from a dispute over a _object_."

Example:  
"_Police_ arrested _a Main Street resident_ for _illegal possession of a handgun and ammunition_ earlier this week, and according to a report _in the Lowell Sun_, the incident stemmed from a dispute over a _frozen cheese pizza_."

### Demo

#### Same as above but use a Ruby class.

Just add a call method to a Ruby class. The call method takes one argument, the enviroment Hash built from the HTTP Request.

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
Write our own _params_ method that will turn the URL params into a hash. 

Enter this in Chrome:  
```
http://localhost:3000/?name=tom&age=57&city=Groton&state=MA
```

To get:  
```
{:name=>"tom", :age=>"57", :city=>"Groton", :state=>"MA"}
```

## Demo
Show the People Rack app.

The files are in lib/person.rb and bin/people_app.rb.

### Routing Lab
Write an app that will:  

* Create a Product class where each product has a name, description and price.  
* Create 10 products and add them to an array.  
* Retrieve all the products by going to localhost:3000/products   
	* Show the products as HTML.
	* Show the products as JSON. _(optional)_
	
	Note: The product class will have to_html and to_json methods.  

* Show each individual Product by going to localhost:3000/product/:id . Where :id is the index of the product in the products array.

For example:  
http://localhost:3000/products will show all the products in HTML, _(the default)_


http://localhost:3000/product/4 show the fourth in HTML, _(the default)_	


                                                                      
