# 6.1 Fix the Program - Mailable
# Correct the following program so it will work properly. Assume that the Customer and Employee classes have complete implementations; just make the smallest possible change to ensure that objects of both types have access to the print_address method.

module Mailable

  def print_address
    puts name
    puts address
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable # fixing code
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable # fixing code
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new
bob = Employee.new
betty.print_address
bob.print_address

# 6.2 Fix the Program - Drivable
# Correct the following program so it will work properly. Assume that the Car class has a complete implementation; just make the smallest possible change to ensure that cars have access to the drive method.

module Drivable
  def drive; end # fixed removing 'self.' from self.drive
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

## 6.3 Assume you have the following code:
#
class House
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def self.compare(home_1, home_2)
    if home_1.price < home_2.price
      "Home 1 is cheaper"
    elsif home_1.price > home_2.price
      "Home 2 is more expensive"
    else
      "Homes have the same price"
    end
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1.price < home2.price
puts "Home 2 is more expensive" if home2.price > home1.price
# and this output:

# Home 1 is cheaper
# Home 2 is more expensive
# Modify the House class so that the above program will work. You are permitted to define only one new method in House.
House.compare(home1, home2)
House.compare(home2, home1)

## 6.4 Reveres Engineering
# Write a class that will display:

# ABC
# xyz
# when the following code is run:

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def uppercase
    text.upcase
  end

  def self.lowercase(data)
    data.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

# 6.5 What Will This Do?
#
# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # Byebye
puts thing.dupdata # HelloHello
