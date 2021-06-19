def square(n)
  multiply(n, n)
end

square(5) == 25

# Exploration: power to the n method

def power(num, power)
  return 0 if power == 0
  return num if power == 1
  multiply(num, power(num, power - 1))
end


=begin
Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.

Note: The ** operator has been disabled.

Examples:
=end



# LONG
=begin
* Problem understanding:
  - Mental model:
    return power using the second argument as raised power to the first.

  - Input: 2 integers

  - Output: integer or nil

  - Rules:
    - Explicit:
        - ** operator is disabled
        - return nil if the second argument is negative.
    - Implicit:
        - id the second argument is zero return 1
        - the first argument can be negative
  - Questions:

* Examples:

* Data Structure:
    - number

* Algorithm:
  - Main Algorithm:
      - from the first argument iterate second argum number times and increment the the quantity as a product. 

  - Ideas:

  - Apporach:
    + as guard clause: 
      +if second arg is negative return nil
      + if second arg is 0 return 1
    + init result array
    + take the secong argument and passw it as number of times,
    + iterate 2_arg times the first argument
    + append each num to result array
    + reduce (multiply each elements)

  - Higher Level Algorithm(helper methods):

* Code:
=end

def power(num, power)
  return nil if power < 0
  return 1 if power == 0
  result = []

  power.times do
    result <<  num
  end
  result.reduce(:*)
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil