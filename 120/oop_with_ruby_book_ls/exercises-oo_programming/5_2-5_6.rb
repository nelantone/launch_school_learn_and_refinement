
# 5.2
# What's the Output?
# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
# What output does this code print? Fix this class so that there are no surprises
#  waiting in store for the unsuspecting developer.
# R=  We were mutating the variable as `upcase!` acts like pass by reference`
#     For avoiding this we will make it to pass by value. Just using it directly
#      @name.upcase instead `@name.upcase!``
# Further Exploration
# What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# This code "works" because of that mysterious to_s call in Pet#initialize.
# However, that doesn't explain why this code produces the result it does.
# Can you?

# R = This code produces that result because is changing
# As we can see fluffy is sacing the value of the instance.
p fluffy #<Pet:0x0000555e11ded040 @name="42">

# 5.3

# Fix the Program - Books (Part 1)
# Complete this program so that it produces the expected output:

class Book
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:
attr_reader :author, :title

def initialize(author, title)
  @author = author
  @title = title
end

def to_s
  %("#{title}", by #{author})
end
end


book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# 5.4
# Fix the Program - Books (Part 2)
# Complete this program so that it produces the expected output:

class Book
  attr_accessor :author, :title
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)
# Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What do you think of this way of creating and initializing Book objects?
#   (The two steps are separate.) Would it be better to create and initialize
#   at the same time like in the previous exercise? What potential problems,
#   if any, are introduced by separating the steps?
# Response:
# If we are sure we will not change the information/states is better the first
# version whenever we think that it will change the information or we are not
# sure, then is better the second version.


# 5.5
# Fix the Program - Persons
# Complete this program so that it produces the expected output:

class Person
  attr_accessor :first_name, :last_name
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person
# Expected output:

# John Doe
# Jane Smith

# or
class Person
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def first_name
    @first_name = first_name.capitalize
  end

  def last_name
    @last_name = last_name.capitalize
  end

  def to_s
    "#{first_name} #{self.last_name}"
  end
end

# Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
# There is nothing technically incorrect about this class, but the definition
# may lead to problems in the future. How can this class be fixed to be
# resistant to future problems?

=begin
Response:
We are allowing to change and see the full database, first we should not allow
to change the database without permissions and second, for now we only might
need some specific data to show that we can add it as private or protected class
and ask for this info.
We should delete `attr_accessor :database_handle` and add :database_handle
specific information when we really need it.
=end
