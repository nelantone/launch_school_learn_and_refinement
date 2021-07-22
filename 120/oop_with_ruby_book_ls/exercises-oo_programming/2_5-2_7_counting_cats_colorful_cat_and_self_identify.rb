# 5. Counting Cats
# Using the following code, create a class named Cat that tracks the number of
# times a new Cat object is instantiated. The total number of Cat instances
# should be printed when ::total is invoked.
class Cat
  @@count_cats = 0

  def initialize
     @@count_cats += 1
  end

  def self.total
    @@count_cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
# Expected output:

# 6. Colorful Cat
# Using the following code, create a class named Cat that prints a greeting
# when #greet is invoked. The greeting should include the name and color of
# the cat. Use a constant to define the color.
class Cat
  COLOR = "blue"

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hi! I am #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
# Expected output:

# Hello! My name is Sophie and I'm a purple cat!

# 2.7 Identify Yourself (Part 2)
# Update the following code so that it prints I'm Sophie! when it invokes
# puts kitty.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty
# Expected output:

# I'm Sophie!