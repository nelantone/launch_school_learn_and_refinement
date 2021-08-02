# 1. Reading and Writing
# Add the appropriate accessor methods to the following code.

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
# Expected output:

# Jessica

# 2. Choose the Right Method
# Add the appropriate accessor methods to the following code.


class Person
  attr_accessor :name
  attr_writer :phone_number
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name
# Expected output:

# Jessica


### CHECK:TODOs

# 3. Access denideds
# Modify the following code so that the value of @phone_number can still be
# read as on line 43, but cannot be changed as on line 12.

class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number

# 4. Comparing Names
# Using the following code, add the appropriate accessor methods.
# Keep in mind that the last_name getter shouldn't be visible outside
# the class, while the first_name getter should be visible outside the class.

class Person
  attr_accessor :first_name, :last_name
  def first_equals_last?
    first_name == last_name
  end

  private
  def last_name
    @last_name
  end
end

person1 = Person.new
p person1.first_name = 'Dave'
p person1.last_name = 'Smith'
p person1.first_name
p person1.last_name
puts person1.first_equals_last?
# Expected output:


#false