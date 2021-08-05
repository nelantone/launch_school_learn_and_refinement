# 5. Who is Older?
# Using the following code, add the appropriate accessor methods.
# Keep in mind that @age should only be visible to instances of Person.

class Person
  # attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected
  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)
# Expected output:

# false

# 6. Guaranteed Formatting
# Using the following code, add the appropriate accessor methods so that @name
# is capitalized upon assignment.

# class Person
#   attr_accessor :name

#   def name
#     @name.capitalize
#   end
# end

# the next solution is more eficient, we don't override name(=name) as above

class Person
  attr_writer :name

  def name(=name)
    @name = name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
# Expected output:

# Elizabeth


# 7. Prefix the Name
# Using the following code, add the appropriate accessor methods so that @name
# is returned with the added prefix 'Mr.'.

class Person
  attr_writer :name
  def name
    "Mr #{@name}"
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name
# Expected output:

# Mr. James


# 8. Avoid Mutation
# The following code is flawed. It currently allows @name to be modified from
# outside the method via a destructive method call. Fix the code so that it
# returns a copy of @name instead of a reference to it.

class Person

  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name

# Expected output:

# James

# 9. Calculated Age
# Using the following code, multiply @age by 2 upon assignment, then multiply
# @age by 2 again when @age is returned by the getter method.

class Person
  def age=(age)
    @age = age * 2
  end

  def age
    @age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age
# Expected output:

# 80


# 10. Unexpected Change
# Modify the following code to accept a string containing a first and last name.
# The name should be split into two instance variables in the setter method,
# then joined in the getter method to form a full name.

class Person
  def name=(name)
    # full_name  = name.split
    # @first_name = full_name.first
    # @last_name  = full_name.last
    ## OR
    @first_name, @last_name = name.split(' ')
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
# Expected output:

# John Doe
