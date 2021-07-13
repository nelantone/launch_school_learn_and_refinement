=begin
1. Create a superclass called Vehicle for your MyCar class to inherit
from and move the behavior that isn't specific to the MyCar class to
the superclass. Create a constant in your MyCar class that stores
information about the vehicle that makes it different from other types
of Vehicles.

Then create a new class called MyTruck that inherits from your superclass
that also has a constant defined that separates it from the MyCar class
in some way.

2. Add a class variable to your superclass that can keep track of the number
of objects created that inherit from the superclass. Create a method to print
out the value of this class variable as well.
## Redoo!


3. Create a module that you can mix in to ONE of your subclasses that
describes a behavior unique to that subclass.

4. Print to the screen your method lookup for the classes that you have created.

5. Move all of the methods from the MyCar class that also pertain to the MyTruck
class into the Vehicle class. Make sure that all of your previous method
calls are working when you are finished.

6. Write a method called age that calls a private method to calculate the
age of the vehicle. Make sure the private method is not available from
outside of the class. You'll need to use Ruby's built-in Time class to help.

=end
module TonsCarring
  def max_carry(num_of_tons)
    hability = num_of_tons <= 10 ? "can" : "can't"

    puts "I #{hability} carry this wheigth!!"
  end
end

class Vehicle
  require 'time'
  
  attr_accessor :color
  attr_reader :year

  @@count = 0

  def initialize(year, color, model)
    @year  = year
    @color = color
    @model = model
    @speed = 0
    @@count += 1
  end
  
  def vehicle_age
    "This vehicle is #{age} years old"
  end

  def self.count_vehicles
    "There are #{@@count} Vechicles created"
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

  def to_s
    "Your vehicle is a #{@model} from #{self.year} and is #{self.color}"
  end
  
  private
  
  def age
    Time.now.year - year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  NUMBER_OF_WHEELS = 4
end

class MyTruck < Vehicle
  extend TonsCarring
  NUMBER_OF_DOORS = 2
end

tonios = MyCar.new(2021, 'black', 'Tonsla SG')
p tonios
p tonios.color
p tonios.year

p trucko = MyTruck.new(2009, 'grey', 'Pegonio T')
p trucko.color
p trucko.year

p trucko_two = MyTruck.new(2019, 'blue', 'Pegonio Ts')

p MyTruck.max_carry(10)
p MyTruck.max_carry(11)


p Vehicle.ancestors
p MyTruck.ancestors
p MyCar.ancestors
p trucko.vehicle_age
p tonios.vehicle_age
p trucko_two.vehicle_age

=begin
7. Create a class 'Student' with attributes name and grade.
Do NOT make the grade getter public, so joe.grade will raise an error.
Create a better_grade_than? method, that you can call like so..

puts "Well done!" if joe.better_grade_than?(bob)
=end
class Student
  attr_reader :name

  def initialize(name, grade)
    @name  = name
    @grade = grade
  end

  def better_grade_than(other_student)
    if grade > other_student.grade
     "Well done! The #{name} grade is greater than #{other_student.grade}"
    else
      "The #{name} grade is less than #{compared_grade}"
    end
  end

  # private ## private will not work calling it in another class
  protected # we can protected methods is that we can call them inside the class
  # of another objects of the same class. (not with private)

  def grade
    @grade
  end
end

p joe = Student.new('Joe', 8)
p filipo = Student.new('Filipo', 7)
p marian = Student.new('Marian', 10)
p joe.better_grade_than(filipo)
p joe.better_grade_than(marian)
p marian.better_grade_than(joe)

=begin
8. #Given the following code...

bob = Person.new
bob.hi
#And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
#What is the problem and how would you go about fixing it?
=end

# Answer = the problem is that we are calling a private method directly
# to fix it we need to call the private method inside a public method.

class Person
  def when_knows_you
    hi
  end

  private

  def hi
    "Hey! I know you! Hi!"
  end
end

p maria = Person.new
p maria.when_knows_you

# or we can move it outside the private method

class Person
  def hi
    "Hey! (Not sure if I know you, but...) 'Hi!'"
  end
end

p dibuti = Person.new
p dibuti.hi

