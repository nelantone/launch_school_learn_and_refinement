# 1
=begin
Find the Class
Update the following code so that, instead of printing the values, each
statement prints the name of the class to which it belongs.
=end

puts "Hello".class
puts 5.class
puts [1, 2, 3].class

#Expected output:
# String
# Integer
# Array


# 2. Create the Class
# Create an empty class named Cat.
class Cat
end

# 3.
# Using the code from the previous exercise, create an instance of Cat and
#  assign it to a variable named kitty.

# Code:

class Cat
end

Kitty = Cat.new


# 4.

# Using the code from the previous exercise, add an #initialize method that
# prints I'm a cat! when a new Cat object is initialized.

# Code:

class Cat
  def initialize
    puts "I'm  a cat!"
  end
end

kitty = Cat.new
# Expected output:

# I'm a cat!
