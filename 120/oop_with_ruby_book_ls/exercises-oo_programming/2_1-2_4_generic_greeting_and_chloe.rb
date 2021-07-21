# 1. Generic Greeting (Part 1)
# Modify the following code so that Hello! I'm a cat! is printed when Cat.
# generic_greeting is invoked.

class Cat
  def self.generic_greeting
    "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
# Expected output:

# Hello! I'm a cat!

# 2. Hello, Chloe!
# Using the following code, add an instance method named #rename that
# renames kitty when invoked.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end
end

kitty = Cat.new('Sophie')
kitty.name
kitty.rename('Chloe')
kitty.name

# Expected output:

# Sophie
# Chloe

# 3. Identify Yourself (Part 1)
# Using the following code, add a method named #identify that returns its
# calling object.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

# Expected output (yours may contain a different object id):

#<Cat:0x007ffcea0661b8 @name="Sophie">


# 4. Generic Greeting (Part 2)
# Using the following code, add two methods: ::generic_greeting and
# #personal_greeting. The first method should be a class method and print a
# greeting that's generic to the class. The second method should be an instance
# method and print a greeting that's custom to the object.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    "Mau"
  end

  def personal_greeting
    "Mau are you? My name is #{name}"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
# Expected output:

# Hello! I'm a cat!
# Hello! My name is Sophie!
