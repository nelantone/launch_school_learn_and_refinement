require 'prime'
# For "x", determine how many positive integers less than or
# equal to "x" are odd but not prime. Assume "x" is an integer
# between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number
# 1 is not prime, so the answer is 1

# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and
# 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than
# 1 that has no positive divisors other than 1 and itself.

# not prime: if I divide a number by other number(can't be 1 or the number itself), the remainder will be zero ---> If I find a number between 2 and the number before my number, and I can divide MYNUMBER by that number and the remainder is zero,

=begin
* Problem understanding:
  - Mental model:
      from 1 to the target number(as argument) find all the odd numbers that are NOT prime numbers.
      - should have nopositive divisors other than 1 and itslef.
  - Input: integer

  - Output: integer

  - Rules:
    - Explicit:

      - If I find a number between 2 and the number before my number, and I can divide MYNUMBER by that number and the remainder is zero,
    - Implicit:
      - reminder of the number should be zero
      - all numbers are positive
  - Questions:

* Examples:

* Data Structure:
    - array
* Algorithm:
  - Main Algorithm:
    - find all odd numbers from 1 and the target(argument)
    - find the not prime numbers from the odd numbers
      - we will select only the odd numbers that has zero as reminder and are not 1( by 3)
    - count all

  - Ideas:

  - Higher Level Algorithm(helper methods):

* Code:
=end

def odd_num_ary(target)
  arry = []
  1.upto(target) do |num|
    arry << num if num.odd?
  end
  arry
end

# We can aslo use `!(num.prime?)` instead.`
def not_prime(num)
  return true if num == 1

  max_num_range = num - 1 # not the number itself

  (2..(max_num_range)).each { |n| return true if num % n == 0 } # starts from `2` because `1` we know is not prime
  false
end

def odd_not_prime(target)
  odd_nums = odd_num_ary(target)

  results_ary = odd_nums.select do |num|
    not_prime(num)
  end
  results_ary.size
end

# 15
# 1 - not prime, 2- prime , 3, 4 5, 6, 7, 8,9, 10 , 11, 12, 13, 14, 15
# 3 --> 2
# 3 % 2 == 0? no - prime

# 13 --> 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12

# 10 --> 2, 3, 4, 5, 6, 7,8
# 10 % 2 == 0 --> prime

# find all primes
# iterate over a range from two to the number before my number
# if I find a number that num % number == 0 - it's not prime
# else prime

p not_prime(1) == true
p not_prime(5) == false
p not_prime(10) == true
p '--'
p odd_not_prime(5) == 1
p odd_not_prime(15) == 3 # I found 3 odd but not prime numbers between 1 and 15
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
