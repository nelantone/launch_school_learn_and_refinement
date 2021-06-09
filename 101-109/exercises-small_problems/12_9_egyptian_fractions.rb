# A Rational Number is any number that can be represented as the result of the
# division between two integers, e.g., 1/3, 3/2, 22/7, etc. The number to the
# left is called the numerator, and the number to the right is
# called the denominator.

# A Unit Fraction is a rational number where the numerator is 1.

# An Egyptian Fraction is the sum of a series of distinct unit fractions
# (no two are the same), such as:

# 1   1    1    1
# - + - + -- + --
# 2   3   13   15
# Every positive rational number can be written as an Egyptian fraction.
# For example:

#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6
# Write two methods: one that takes a Rational number as an argument,
# and returns an Array of the denominators that are part of an Egyptian
# Fraction representation of the number, and another that takes an Array
# of numbers in the same format, and calculates the resulting Rational number.
# You will need to use the Rational class provided by Ruby.

# Examples:
# LONG
=begin
* Problem understanding:
  - Problem domain:
    2 problems:
      - Find all the denominators of the rational number and return them
        as a collection
      - do the other way around:
        * given a rational fraction find the number(unegyptian)

  - Mental model:
      - find the result of a fraction with 1 divided by x numbers starting
        from 1.
      - And from a number find the specific fractions.

  - Input: array(fraction)/number

  - Output: number/array(fraction)

  - Rules:
    - Explicit:
        - needs to be rational number
        - the sum of the factions needs to be the total of the number

    - Implicit:
     - in the fractions one num needs to be float(to see the float version)
     - the result is in integers

  - Questions:

* Examples:

* Data Structure:
    -

* Algorithm:
  - Main Algorithm:
      do a loop
      from a 1/
      add as denominator 1,2,...X until we have as a float the total num

  - Ideas:

  - Apporach:

  - Higher Level Algorithm(helper methods):

* Code:
=end
# require 'rational'
# p Rational(2, 1) == (2/1)
# p Rational(137, 60)
# p Rational(3, 1)

# def egyptian(rational)
#   float_target      = rational
#   egyptian_fraction = []
#   denominator       = 1
#   result            = []

#   until egyptian_fraction == float_target
#     if egyptian_fraction.sum > float_target
#       egyptian_fraction.pop
#       result.pop
#     else
#       egyptian_fraction << Rational(1.0/denominator)
#       result << denominator
#     end
#     denominator+=1
#   end
#   result
# end

# def unegyptian(ary)
#   ary.map { |elem| Rational(1.0/(elem)) }
# end
# def egyptian(target_value)
#   denominators = []
#   unit_denominator = 1
#   until target_value == 0
#     unit_fraction = Rational(1, unit_denominator)
#     if unit_fraction <= target_value
#       target_value -= unit_fraction
#       denominators << unit_denominator
#     end

#     unit_denominator += 1
#   end

#   denominators
# end

# def unegyptian(denominators)
#   denominators.inject(Rational(0)) do |accum, denominator|
#     accum + Rational(1, denominator)
#   end
# end

def egyptian(rational)
  float_target      = rational.to_f.round(9)
  egyptian_fraction = []
  denominator       = 1
  result            = []

  until egyptian_fraction.sum.round(9) == float_target
    if egyptian_fraction.sum.round(9) > float_target
      egyptian_fraction.pop
      result.pop
    else
      egyptian_fraction << (1.0/denominator).round(9)
      result << denominator
    end
    denominator+=1
  end
  result
end

def unegyptian(ary)
  ary.map { |elem| Rational(1.0/elem) }.sum.round(2)
end

p egyptian(Rational(2, 1)) == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57961]

p unegyptian([1, 2, 3, 6]) == 2.0
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130)))== Rational(49/50r) # == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) ==  Rational(71/100r) # == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

