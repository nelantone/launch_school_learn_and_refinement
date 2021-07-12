# 1. How do we create an object in Ruby? Give an example of the creation of an object.

# => We create an object hwile defining a class and invoking the class

# class definition

class MyEmptyClass
  puts 'I am not so empty as you expected'
end

# class invokation

MyEmptyClass.new
# => I am not so empty as you expected

# 2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

# => Module: is a way to encapsulate a noun and methods without creating an object.
# Is very similar to a class but just without the option to instanciate.
# Module prupose: organize the code in a way we can encapsulate some information
# and reuse the code. Also we can use the same module in different classes. 
# then we need to add `include "MyModule"` on the first line of the class we want to use.
# Example

module AbsurdModule
   puts 'Nihao!'
end

class MyEmptyClass
  include AbsurdModule
  AbsurdModule
  puts 'here again,I am not so empty as you expected'
end
 
 # class invokation
 MyEmptyClass.new
 # => I am not so empty as you expected
