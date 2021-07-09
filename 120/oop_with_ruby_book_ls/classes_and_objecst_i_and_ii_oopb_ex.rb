=begin
1. Create a class called MyCar. When you initialize a new instance or
object of the class, allow the user to define some instance variables that
 tell us the year, color, and model of the car. Create an instance variable
 that is set to 0 during instantiation of the object to track the current
 speed of the car as well. Create instance methods that allow the car to
 speed up, brake, and shut the car off.

 2. Add an accessor method to your MyCar class to change and view the color
 of your car. Then add an accessor method that allows you to view, but not
modify, the year of your car.

3. You want to create a nice interface that allows you to accurately describe
the action you want your program to perform. Create a method called spray_paint
that can be called on an object and will modify the color of the car.

4. Add a class method to your MyCar class that calculates the gas mileage of any car.

=end


class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year  = year
    @color = color
    @model = model
    @speed = 0
  end

  def to_s
    "Your car is a #{@model} from #{self.year} and is #{self.color}"
  end

  def current_speed
    @speed
  end

  def speed_up(km_h)
    @speed += km_h
  end

  def speed_down(km_h)
    @speed -= km_h
  end

  def brake
    @speed = 0
  end

  def shut_down
    puts "The car is off, thanks for using Tonsla cars!"
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "youd decide to paint your car #{color}, great idea!"
  end

  def self.gas_mileage(distance_km_or_miles, gas_price, monetary_units)
    total = distance_km_or_miles * gas_price
    "You will spend #{total} #{monetary_units}"
  end

end

tonios = MyCar.new('2021', 'black', 'Tonsla SG')

tonios.current_speed
tonios.speed_down(5)
tonios.speed_up(10)
tonios.brake
tonios.current_speed
tonios.speed_down(1)
tonios.speed_up(11)
tonios.speed_down(6)
tonios.current_speed
tonios.year
tonios.color
tonios.color = 'white'
tonios.color
tonios.spray_paint('blue')
tonios.color
puts tonios.inspect
tonios.shut_down
MyCar.gas_mileage(10, 1.1, 'eur')
puts tonios

5. When running the following code...

=begin
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
We get the following error...

test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
Why do we get this error and how do we fix it?
=end
he error is because we are trying to set a new state of the class variable name
but we are using an attr_reader instead. If we want to write and/or read/write
we need to add:
`attr_writer` to reassign the class variable
`attr_accessor` to read and write the class variable
