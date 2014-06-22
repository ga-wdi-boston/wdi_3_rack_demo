# Ruby class that can be a rack app.
class MyApp
  def call env
    # we're just trying to force an exception to check out the
    # Rack::ShowExceptions
    raise "I'm an exception here, heeeeeeellooo"
    [200, {"Content-Type" => "text/html"}, ["hey there show exceptions"]]

  end
end
