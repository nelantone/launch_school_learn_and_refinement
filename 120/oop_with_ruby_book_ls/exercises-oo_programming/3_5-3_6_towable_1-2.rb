# Towable (Part 1)
# Using the following code, create a Towable module that contains a method
# named tow that prints I can tow a trailer! when invoked. Include the module
# in the Truck class.

module Towable
  def tow
    'I can Tow a trailer1'
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow

# Expected output:

# I can tow a trailer!

# Towable (Part 2)
# Using the following code, create a class named Vehicle that, upon instantiation
# ,assigns the passed in argument to @year. Both Truck and Car should inherit
# from Vehicle.

class Vehicle
  attr_accessor :year
  def initialize(year)
    @year = year
  end
end

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
  # def initialize(year)
  #  super
  # end
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year
# Expected output:

# 1994
# I can tow a trailer!
# 2006