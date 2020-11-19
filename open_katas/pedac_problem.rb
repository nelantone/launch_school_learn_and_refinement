# Suppose you have an arbitrary natural number (the target) and a set of one or more additional natural numbers (the factors). Write a program that computes the sum of all numbers from 1 up to the target number that are also multiples of one of the factors.
# For instance, if the target is 20, and the factors are 3 and 5, that gives us the list of multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78.
# If no factors are given, use 3 and 5 as the default factors.
#
#  1. Problem analisis
#   Input: 1. Arbitrary number(target)
#          2. more additional numbers(factors)
#
#   Output: sum of all numbers from 1 up to target number that are multiples(factors)
#
#   Explicit requirements:
#   target_number, ex:20
#   factors, ex: 3,5 (defaulto ones)
#   additional_numbers from 1 to target number that are multiples of that factors.
#   multiples are the numbers that can be divisble from another number and don't generate a reminder(target) ex:
#   multiples of 3 from 1 to 19: 3,6,9,12,15,18
#   multiples of 3 from 1 to 19: 5,10,15
#
#   Rules & Impliciti requirements:
#   - implicit on the example that 20 is not included
#   - natural numbers* 0 it is a natural number but it is implicit that we start from 1.
#   - the multiple of the summed must be unique(implicit from the example).
#   - when no factors given user 3,5 as default factors
#   - result of the factors need to be multiples from 1 to target number.
#
#   Mental model*
#  My own:
#   We want to add all the multiple numbers from a specific n to target number, iterating each number from specific factors and selecting the ones that are multiple generating an unique list of numbers expecting the result of adding all this list of numbers.
#
#  Example:  Determine a list of all multiples of a set of factors up to a target value, then filter the list of multiples to the unique values. Finally, compute and return the sum of the unique multiples.
#   Example2: Incrementally build a list of numbers that are multiples of a set of one or more factors. Add a multiple to the list only if it is not yet on the list. Finally, compute and return the sum of the numbers on the list.
#
#
# 2. Examples*(one by one):
#   Inputs:
#     target 20
#     default_factors(and in case no giving num) : 3, 5
#    Output:
#     78
#
#   Example 2
#     Inputs:
#       Target number: 20
#       Factors: [3]
#     Output:
#        63
#
# 3. Data:
#    *Questions/to Clarify:
#    1. Are negative number allowed? no, only natural numbers
#    2. how the factors will be provided? Factors should be in an array
#    3. range from 1 to the target-1(we don't include the target in the range)
#    4.  we add the numbers that are multiple to a new array
#    5. 3 and 5 are default array item/factors when we don't have an array
#    6.  For the arrays we can use modulo operator and iterations or loops. Maybe #select is the fastest and pragmatic approach.
#
# 4. Algoritm:
#    1. We take the arbitrary number(target) and the factors
#    2. We define a range of numbers from 1 to the target(target number not included)
#    3. We pass each of the range numbers to a modulo conditional and we initialize an empty array for the multiple nums
#    4, This modulo conditional it is another array with all factors what we also iterate eacho of them
#    5. With a conditional we add each of the numbers that are multiple of the specific factor
#    6. We repeat the process pasing the range of numbers for each factor and adding the multiples to the new multiple_num array
#    4. we find all multiple numbers from each factor number until the last one.
#    5. Once we have all numbers we make a unique list form this array  all the numbers and we add al numbers
#    6. The output should be the total
#
# 5. Code:

arbitrary_number = 20
def sum_multiples_of(target, factors = [3, 5])
  range = (1...target)
  factor_multiple_num = []
  factors = [3, 5] if factors.empty?
  range.select do |number|
    factor_multiple_num << number if factors.one? && (number % factors.first).zero?
    factors.each { |factor| factor_multiple_num << number if (number % factor).zero? }
  end
  p factor_multiple_num.uniq.sum
end

p sum_multiples_of(arbitrary_number) == 78
p sum_multiples_of(20, [3]) == 63
p sum_multiples_of(20, []) == 78
p sum_multiples_of(1, []).zero?
p sum_multiples_of(20, [19]) == 19
