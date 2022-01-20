# Question 1
# Which of the following are objects in Ruby? If they are objects, how can you
# find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142
=begin
the 4 are objects, we can find out which class belong to with #class
instance method.
=end
p true.class #TrueClass
p "hello".class #String
p [1, 2, 3, "happy days"].class #Array
p 142.class #Integer

# Question 2
#If we have a Car class and a Truck class and we want to be able to go_fast,
#how can we add the ability for them to go_fast using the module Speed?
# How can you check if your Car or Truck can now go fast?
# Response

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed #added
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed #added
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

#response:
Car.new.go_fast
Truck.new.go_fast

# Question 3
# In the last question we had a module called Speed which contained a go_fast
# method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class
# (as shown below) you might have noticed that the string printed when we go
# fast includes the name of the type of vehicle we are using.
# How is this done?

# >> small_car = Car.new
# >> small_car.go_fast
# I am a Car and going super fast!

=begin
response:

Speed method is included in the class Car and Truck.
when we instanciate an Truck or Car object #go_fast is included on the specific
method that is shown as `self` inside the module.
**
We use self.class in the method and this works the following way:

self refers to the object itself, in this case either a Car or Truck object.
We ask self to tell us its class with .class. It tells us.
We don't need to use to_s here because it is inside of a string and is
interpolated which means it will take care of the to_s for us.
=end

# Question 4
# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

AngryCat.new

# Question 5
# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=begin
Pizza class has an instance vaiable. We know as it is defined and initialized
we can also check using Pizza.new('Tono')
Fruit don't have any instance and does not return anything when we try to access.
Fruit.new('Papaya')

**
You can find out if an object has instance variables by either looking at the
class or asking the object. First, lets look at the class definitions.

You might have noticed in the Pizza class there is a variable where the variable
name starts with an @ symbol. This means that this class has an instance variable.

But let us be triple sure that only Pizza has an instance variable by asking
our objects if they have instance variables.

To do this we first need to create a Pizza object and a Fruit object.

Copy Code
hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")
Now we can ask each of these objects if they have instance variables.

Copy Code
>> hot_pizza.instance_variables
=> [:@name]
>> orange.instance_variables
=> []
As you can see, if we call the instance_variables method on the instance of the
class we will be informed if the object has any instance variables and what
they are.

By doing this we have found out that Pizza has instance variables while Fruit
does not.
=end

# Question 6
# What could we add to the class below to access the instance variable @volume?
class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end
#response=
a = Cube.new(6)
p a.volume

=begin
adding a method called get_volume:

class Cube
  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end
Now if we call get_volume on our big_cube we will get:

>> big_cube.get_volume
=> 5000
=end

# Question 7
# What is the default return value of to_s when invoked on an object?
# Where could you go to find out if you want to be sure?

=begin
the default return value is the object Id itself with the id number and all
the instance variables initialized.
we can do `ri Object#to_s` to see the definition

**
By default, the to_s method will return the name of the object's class and an
encoding of the object id.

If you weren't sure of this answer you could of course refer to Launch School's
Object Oriented Programming book, but you could also refer directly to the Ruby
documentation, in this case,
here: http://ruby-doc.org/core/Object.html#method-i-to_s.
=end

# Question 8
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self.
# What does self refer to here?
=begin
Response:
self refers here the current instance when we use it.
When we initialize it self is Cat.
and we are making sure that Ruby knows that age is a setter method that
will change the value in one year and is not a new variable.

**
Firstly it is important to note that make_one_year_older is an instance
method and can only be called on instances of the class Cat.
Keeping this in mind the use of self here is referencing the instance (object)
that called the method - the calling object.
=end

# Question 9
# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the name of the cats_count method we have used self.
# What does self refer to in this context?
=begin
In this context self is telling us that this method is a class method.
We don't need to instanciate any object to call the method. We can just do
Cat.cats_count

**
Because this is a class method it represents the class itself, in this case Cat.
 So you can call Cat.cats_count
=end

# Question 10
# If we have the class below, what would you need to call to create a new
# instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

#answer
Bang.new('black, cotton')
=begin

=end