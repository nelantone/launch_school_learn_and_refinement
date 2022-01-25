#Practice Problems: Easy 3

# Question 1
# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:
hello = Hello.new
hello.hi
# => Hello


# case 2:
hello = Hello.new
hello.bye
# => Unefined method

# case 3:
hello = Hello.new
hello.greet
# => wrong number of arguments

# case 4:
hello = Hello.new
hello.greet("Goodbye")
# => Goodbye

# case 5:
Hello.hi
# => Undefined class method ...

=begin
**
case 1

"Hello" is printed to the terminal.

case 2

An undefined method error occurs. Neither the Hello class nor its parent class
Greeting have a bye method defined.

case 3

An ArgumentError reporting a wrong number of arguments is returned.
The Hello class can access its parent class's greet method, but greet takes an
argument which is not being supplied if we just call greet by itself.

case 4

"Goodbye" is printed to the terminal.

case 5

An undefined method hi is reported for the Hello class. This is because the hi
method is defined for instances of the Hello class, rather than on the class
itself. Since we are attempting to call hi on the Hello class rather than an
instance of the class, Ruby cannot find the method on the class definition.
=end

# Question 2
# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi # code changed
  # def hi
    greeting = Greeting.new # code changed
    greeting.greet("Hello") # code changed
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

# If we call Hello.hi we get an error message. How would you fix this?

=begin
his is rather cumbersome. Note that we cannot simply call greet in the
self.hi method definition because the Greeting class itself only defines
greet on its instances, rather than on the Greeting class itself.
=end

# Question 3
# When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class
# with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# response
p ac_one = AngryCat.new(2, 'fire-on-water')
p ac_two = AngryCat.new(5, 'frozen-weat')
p ac_one.equal?ac_two

=begin
We now have two different instances of the AngryCat class.

You will have noticed there is no new method inside of the AngryCat class,
so how does Ruby know what to do when setting up the objects? By default,
  Ruby will call the initialize method on object creation.

Now we can confirm that each of our cats are different by asking for their
ages and names.

>> henry.name
Henry
>> henry.age
12
>> alex.name
Alex
>> alex.age
8
As you can see, they have two different sets of attributes from when they
were created.
=end

# Question 4
# Given the class below, if we created a new instance of the class and then
# called to_s on that instance we would get something like
# "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end

# How could we go about changing the to_s output on this method to look
# like this: I am a tabby cat? (this is assuming that "tabby" is the type
# we passed in during initialization).

# Response
class Cat

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat?"
  end

  private
  attr_reader :type
end

puts Cat.new('tabby')

=begin
We can customize existing methods like this easily, but in many cases it
might be better to write a new method called something like display_type
instead, as this is more specific about what we are actually wanting the
result of the method to be. An example of this would be:
=end
class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def display_type
    puts "I am a #{type} cat"
  end
end

# Question 5
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# What would happen if I called the methods like shown below?

tv = Television.new
# tv.manufacturer # undefined method #manufacturer
tv.model

Television.manufacturer
# Television.model # undefined method #model

=begin
f you attempted to call tv.manufacturer you would get an error and it would
look something like this undefined method manufacturer for #<Television:XXXX>,
this is because tv is an instance of the class Television and manufacturer is
a class method, meaning it can only be called on the class itself (in this case
Television).

You would also get an error if you tried to call Television.model, the error
would look something like NoMethodError: undefined method 'model' for
Television:Class. This is because this method only exists on an instance of
the class Television in this case tv.
=end

# Question 6
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    # self.age += 1
    @age += 1 # added change
  end
end

# In the make_one_year_older method we have used self. What is another way
# we could write this method so we don't have to use the self prefix?

=begin
When we change the state of an attribute we can use @ instead self.
**
In this case self and @ are the same thing and can be used interchangeably.

=end

# Question 7
# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
# response: we don't need return as is the last statement inside self#information
# we also don't need attr_accessor in case we don't need to get the state/s or set
# new value/s.

=begin
**
The answer here is the return in the information method. Ruby automatically
returns the result of the last line of any method, so adding return to this
line in the method does not add any value and so therefore should be avoided.
We also never use the attr_accessor for brightness and color. Though, these
methods do add potential value, as they give us the option to alter brightness
  and color outside the Light class.

=end
