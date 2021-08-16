# 7. Fix the following code so it works properly:

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
    # we can use @mileage too but is better to pass
    # a setter method instead the instance variable
    # unless we have a good reason to use the instance
    # variable directly
  end


  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

# 8. Rectangles and Squares
# Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(length_of_side)
    super(length_of_side, length_of_side)
  end
end

# Write a class called Square that inherits from Rectangle, and is used like this:

square = Square.new(5)
puts "area of square = #{square.area}"

# 9. Complete the Program - Cats!
# Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, fur_color)
    super(name, age)
    @fur_color = fur_color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@fur_color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
# Update this code so that when you run it, you see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.


# further Exploration

# An alternative approach to this problem would be to modify the Pet class
# to accept a colors parameter. If we did this, we wouldn't need to supply
# an initialize method for Cat.

#  Why would we be able to omit the initialize method?
# R: we can omit the initialize method from Cat because Pet is the parent
# and we are passing all the attributes to Cat.

#  Would it be a good idea to modify Pet in this way? Why or why not?
# R: it depends, we need to see if we want or need to initialize in all pets
# the pet color, otherwise will not have sense to do it or we will need to add
# a default color. It depends our needs.

# How might you deal with some of the problems, if any, that might arise from
# modifying Pet?

# The problems will be passing a new attribute in other pets, we need to have at
# least a default color, otherwise we will raise an exception.

# 10. Refactoring Vehicles
# Consider the following classes:

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle

  def wheels
    4
  end

end

class Motorcycle < Vehicle
  def wheels
    2
  end


end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

p Car.new('a','b')
p Motorcycle.new('c', 'd')
p Truck.new('f','g', 'h')

# Refactor these classes so they all use a common superclass,
# and inherit behavior as needed.

# Further Exploration
# Would it make sense to define a wheels method in Vehicle even though all of
# the remaining classes would be overriding it? Why or why not? If you think it
# does make sense, what method body would you write?

# R: We can add the wheels as constants

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Truck < Vehicle
  WHEELS = 6
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model, wheels)
    @payload = payload
  end
end