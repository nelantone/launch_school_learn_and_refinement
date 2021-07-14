# 1.
# Class based inheritance works great when it's used to model hierarchical domains.
# Let's take a look at a few practice problems. Suppose we're building a software
# system for a pet hotel business, so our classes deal with pets.

# Given this class:

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
#  One problem is that we need to keep track of different breeds of dogs, since
# they have slightly different behaviors. For example, bulldogs can't swim,
# but all other dogs can.

class Bulldog < Dog
  def swim
    "can't swim"
  end
end
# Create a sub-class from Dog called Bulldog overriding the swim method
# to return "can't swim!"
Bulldog.new.swim # =>  can't swim


# 2.  Let's create a few more methods for our Dog class.

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end

# Create a new class called Cat, which can do everything a dog can, except
# swim or fetch. Assume the methods do the exact same thing. Hint: don't just
# copy and paste all methods in Dog into Cat; try to come up with some class
# hierarchy.


class Mammal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Mammal
  def swim
    "can't swim!"
  end

  def fetch
    "I am a cat I don't do this things. Look for a dog"
  end

  def speak
    'mau!'
  end
end

class Dog < Mammal
end

Cat.new.swim # => "can't swim!"
Dog.new.swim # => "swimming!"


pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run                # => "running!"
pete.speak              # => NoMethodError

kitty.run               # => "running!"
kitty.speak             # => "meow!"
kitty.fetch             # => NoMethodError

dave.speak              # => "bark!"

bud.run                 # => "running!"
bud.swim                # => "can't swim!"

# 3. Draw a class hierarchy diagram of the classes from step #2
# BssicObject
# |
# TypeObject
# |
# Mammal -> Cat -> cannot swim/ speak Mau
#       |
#        -> Dog -> can swim / speak Wof
#             |
#              -> Bulldog -> cannot swim / Speak Wof
