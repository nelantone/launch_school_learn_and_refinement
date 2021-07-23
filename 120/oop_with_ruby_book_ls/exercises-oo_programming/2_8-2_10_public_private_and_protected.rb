# 8. Public Secret
# Using the following code, create a class named Person with an instance
# variable named @secret. Use a setter method to add a value to @secret,
# then use a getter method to print @secret.

class Person
  attr_accessor :secret

  ## or
  # def secret=(the_secret)
  #     @secret = the_secret
  # end
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

# Expected output:

# Shh.. this is a secret!

# 9. Private Secret
# Using the following code, add a method named share_secret that prints the
# value of @secret when invoked.

class Person
  attr_writer :secret

  def share_secret
    self.secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

# Expected output:

# Shh.. this is a secret!

# 10. Protected Secret
# Using the following code, add an instance method named compare_secret that
# compares the value of @secret from person1 with the value of @secret from
# person2.

class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

person3 = Person.new
person3.secret = 'Shh.. this is a secret!'

puts person1.compare_secret(person2)
puts person1.compare_secret(person3)
# Expected output:

# false

