class MyApp
  def call env
    [200, {"Content-Type" => "text/html"}, ["Hey there from MyApp class, Time is #{Time.now}"]]
  end
end
