# 5. Hello, Sophie! (Part 1)
# Using the code from the previous exercise, add a parameter to
# initialize that provides a name for the Cat object. Use an instance variable
# to print a greeting with the provided name. (You can remove the code that
# displays I'm a cat!.)


class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
# puts kitty
# Expected output:

# Hello! My name is Sophie!

# 6.
# Using the code from the previous exercise, move the greeting from the
# #initialize method to an instance method named #greet that prints a greeting
# when invoked.

# Code:


# Hello! My name is Sophie!

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    "Hello my name is #{@name}"
  end

end

kitty = Cat.new('Sophie')
kitty.greet