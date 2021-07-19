# 7. Reader
# Using the code from the previous exercise, add a getter method named
# #name and invoke it in place of @name in #greet.

# Code:

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{self.name}!" # self is optional
    # in some cases is more descriptive to add self. In other cases
    # (ex: setting the instance var)we need to add it.
  end
end

# or

class Cat
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

# Expected output:

# Hello! My name is Sophie!

# 8. Writer
# Using the code from the previous exercise, add a setter method named
# #name=. Then, rename kitty to 'Luna' and invoke #greet again.

# Code:

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

# or
class Cat
  attr_reader :name
  attr_writer :name # actually will have more sense to write att_accessor

  def initialize(name)
    @name = name
  end


  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.name = 'Luna'
kitty.greet

# Expected output:

# Hello! My name is Sophie!
# Hello! My name is Luna!

# 9. Accessor

#Using the code from the previous exercise, replace the getter and setter
#methods using Ruby shorthand.

# Code:

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet

# Expected output:

# Hello! My name is Sophie!
# Hello! My name is Luna!

