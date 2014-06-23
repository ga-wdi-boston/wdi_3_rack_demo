require 'pry'
require 'rack'

require_relative '../lib/person'

module PeopleApp
  class PeopleService

    attr_accessor :people

    def initialize
      @people = []
      create_people
    end

    def random_price
      (rand(1..10).to_f + rand(1..100).to_f/100).round(2)
    end
    
    def create_people
      10.times do |i|
       @people <<  Person.new("person_#{i}", "description #{i}", random_price)
      end
    end

    def call(env)
      request = Rack::Request.new(env)
      response = Rack::Response.new

      puts "request.path_info  = #{request.path_info}"
      
      # Set the HTTP Response Content-Type to Plain text
      # response.header['Content-Type'] = 'text/plain'

      if request.request_method == 'GET'
        html = '<html><head></head><body><h3>People</h3><dl>'

        if request.path_info == '/people'
          self.people.each do |person|
           html += person.to_html
          end
        elsif request.path_info =~ /\/people\/+\d/
          index = request.path_info.split('/').last.to_i
          puts "index is #{index}"
          html += self.people[index].to_html
        else
          puts "Undefined route"
        end

        html += '</dl></body></html>'
        response.write(html)

      end
      response.finish
    end
  end
end

Rack::Handler::WEBrick.run(PeopleApp::PeopleService.new, Port: 3000)
