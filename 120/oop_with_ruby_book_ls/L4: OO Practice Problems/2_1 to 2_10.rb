# Question 1
# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

=begin
Can be any of the 3 choices.

**
Each time you call, a string is returned which will be of the form
"You will <something>", where the something is one of the 3 phrases
defined in the array returned by the choices method. The specific string
will be chosen randomly.
=end

# Question 2
# We have an Oracle class and a RoadTrip class that inherits from the
# Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

=begin
RoadTrip is a subclass of Oracle, is overwritting #choices method. On the
same time we can access and use #predict_the_future

**
Now the string returned will be of the form "You will <some trip>" where the
trip is taken from the choices defined by the choices method of RoadTrip.

Why does this happen? Doesn't the choices called in the implementation of
Oracle's predict_the_future look in the Oracle class for a choices method?
The answer is that since we're calling predict_the_future on an instance
of RoadTrip, every time Ruby tries to resolve a method name, it will start
with the methods defined on the class you are calling. So even though the
call to choices happens in a method defined in Oracle, Ruby will first look
for a definition of choices in RoadTrip before falling back to Oracle if it
  does not find choices defined in RoadTrip
=end

# Question 3
# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

=begin
Response:
Taste
Object
Kernel
BasicObject

**
The list of ancestor classes is also called a lookup chain, because Ruby
will look for a method starting in the first class in the chain (in this case
HotSauce) and eventually lookup BasicObject if the method is found nowhere in
the lookup chain.

If the method appears nowhere in the chain then Ruby will raise a NoMethodError
which will tell you a matching method can not be found anywhere in the chain.
=end
p Orange.ancestors


# Question 4
# What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?

class BeesWax
  attr_accessor :type ##added

  def initialize(type)
    @type = type
  end

 ## removed
  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    # puts "I am a #{@type} of Bees Wax"
    puts "I am a #{type} of Bees Wax"
    ## This is much cleaner, and it is standard practice to refer to
    ## instance variables inside the class without @ if the getter method
    ## is available.
  end
end

# Question 5
# There are a number of variables listed below. What are the different
# types and how do you know which is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

=begin
if there are no `@` is a local variable
`@` is an instance variable and his scope is inside.
`@@` is a class variable and the scope is inside the class and on each created
instance`
**
Here we have the following variables:

Local variable:
- excited_dog
Instance variable:
- @excited_dog
Class variable:
- @@excited_dog

We can tell which is which by how the variables are prefixed. Local variables
do not contain anything prefixed, while instance variables are prefixed with
the @ and class variables are prefixed with @@.
=end

# Question 6
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know?
# How would you call a class method?
=begin
R=
class method is always starting with `self`
=end
Television.manufacturer


# Question 7
# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    # @@cats_count += 1
    puts @@cats_count += 1 #** added
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works.
# What code would you need to write to test your theory?

=begin
@@cats_count is a class variable that will increas every time instanciate/create
and object, then we can track the number of objects.

To test our theory

**
The @@cats_count variable is here to keep track of how many cat instances have
 been created. We can know this because of where in the code the number
 incremented.

Every time we create a cat using Cat.new("tabby") we will be creating a new
instance of the class Cat. During the object creation process it will call
the initialize method and here is where we increment the value of the
@@cats_count variable.
=end
cat1 = Cat.new('mau') # => 1
cat2 = Cat.new('butsy') # => 2
cat3 = Cat.new('Sysisphos') # =>3
p Cat.cats_count # => 3

# Question 8
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end
# And another class:
class Bingo < Game # <  Game as added
  def rules_of_play
    #rules of play
  end
end
# What can we add to the Bingo class to allow it to inherit the play
# method from the Game class?

## R=
game_of_bingo = Bingo.new
#=> #<Bingo:0x007f9d19b537c8>
game_of_bingo.play
#=> "Start the game!"

# Question 9
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in
# mind that there is already a method of this name in the Game class that the
# Bingo class inherits from.

=begin
When we instanciate a Bingo object and we call #play
the #play method that will be executed first is the one in Bingo.
Ruby finds always the first method on the main class and then follows the
anncestors order.

**
If we added a new method to the Bingo class as seen below, it will use that
method instead of looking up the chain and finding the Game class's method.
Because Ruby doesn't want to look all over the place, as soon as it finds a
method that matches it uses that - so in this case it is really first come
first served.
=end

# Question 10
# What are the benefits of using Object Oriented Programming in Ruby?
# Think of as many as you can.

=begin
1. DRY code:
Easier to:
  2. read
  3. refactor
  4. organize
  5. escale
  6. maintain
  7. document
  8. debugg
We can:
  9. store information from a specific object
  10. protect information and  specific methods/behaviors.
  11. make easier schemas of an idea.
  12. assocciate different objects.

  **

Because there are so many benefits to using OOP we will just summarize some of the major ones:

Creating objects allows programmers to think more abstractly about the code they are writing.
Objects are represented by nouns so are easier to conceptualize.
It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
It allows us to easily give functionality to different parts of an application without duplication.
We can build applications faster as we can reuse pre-written code.
As the software becomes more complex this complexity can be more easily managed.
=end
