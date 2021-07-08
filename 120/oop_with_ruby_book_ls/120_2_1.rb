# 1. Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :name
  def initialize(name)
    @name =name
  end
end

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'

# 2. Modify the class definition from above to facilitate the following methods.
#  Note that there is no name= setter method now. ** Re-do I!!!

# my solution
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    @full_name  = full_name.split
    @first_name = @full_name.first
    @last_name  = @full_name.size == 1 ? '' : @full_name.last
  end

  def name
    @last_name == '' ? first_name : "#{first_name} #{last_name}"
  end

end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
mr_koch = Person.new('Robert Koch')
mr_koch.last_name             # => ''
mr_koch.last_name = 'Koch'
mr_koch.name

# Their solution
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
mr_koch = Person.new('Robert Koch')
mr_koch.last_name             # => ''
mr_koch.last_name = 'Koch'
mr_koch.name

# Now create a smart name= method that can take just a first name or a full
# name, and knows how to set the first_name and last_name appropriately.

# my solution
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    @full_name  = full_name.split
    @first_name = @full_name.first
    @last_name  = surname_helper(full_name)
  end

  def surname_helper(full_name)
    full_name_array = full_name.split
    full_name_array.size == 1 ? '' : full_name_array.last
  end

  def name
    "#{@first_name} #{@last_name} ".strip
  end

  def name=(name)
    if name
      new_name = name.split
      @first_name = new_name.first
      @last_name  = surname_helper(name)
    else
      @last_name = surname_helper(name)
      "#{first_name} #{@last_name}"
    end
  end

end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'


# Other solution
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'


# My solution refactored
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    @full_name  = full_name.split
    @first_name = @full_name.first
    @last_name  = surname_helper(full_name)
  end

  def surname_helper(full_name)
    full_name_array = full_name.split
    full_name_array.size == 1 ? '' : full_name_array.last
  end

  def name
    "#{@first_name} #{@last_name} ".strip
  end

  def name=(name)
    parse_full_name(name)
  end

  ptivate
  def parse_full_name(name)
    if name
      new_name = name.split
      @first_name = new_name.first
      @last_name  = surname_helper(name)
    else
      @last_name = surname_helper(name)
      "#{first_name} #{@last_name}"
    end
  end
end
