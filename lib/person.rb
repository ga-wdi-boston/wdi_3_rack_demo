module PeopleApp
  class Person

    attr_accessor :name, :description, :price

    def initialize(name, description, price)
      @name, @description, @price = name, description, price
    end

    def to_html
      "<dt>#{@name}</dt><dd>#{@description} costs #{@price}</dd>"
    end
  end
end
