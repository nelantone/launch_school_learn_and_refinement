=begin
Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .

Notes
List size is at least 2 .

List's numbers will only have positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

Input >> Output Examples
1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .
2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .
3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .
=end

=begin
* Problem understanding:
  - Problem domain:
   - prime numbers: are should be positive and also divisible by another(with no reminder) numer but not counting 1,
    and not by his own.

  - Mental model:
    - from the sum of all elements inside an array use this result as base(sum) and finde the next prime number(next_prime)
    The result we want is the difference between the prime number and the result-base (first_prime  - sum).

  - Input: an array

  - Output: integer

  - Rules:
    - Explicit:
      -all integers and positive

    - Implicit:
      -  when the sum is already prime return the sum

  - Questions:

* Examples:

* Data Structure:

    - ?

* Algorithm:
  - Main Algorithm:
    - sum all elements inside the array
    - create a method to determine if it is prime number
        - number/argument should be positive and also not divisible
          by another number (with reminder) but not by 1 and not by his own.
            - start a range from2.. to the number `-1`( but not by 1 and not by his own.)
            - iterate on the range, as we want a reminder zero, we use modulo operator
                num % n.
            - if num % n is true, return false(is not a prime number)
    - check if the `total_sum` is a prime number with `is_prime` method helper
      - if it is `total_sum`  is prime reutrn `0`(Guard Clause) <= don't need it later
        refactoring
      - add +1 until we find the next prime nuumber `first_prime`
        - when we have the number then we do
          (first_prime  - total_sum).

  - Higher Level Algorithm(helper methods):
    - maybe create the `prime?` method

* Code:
=end
# require 'prime'

def is_prime(num)
  (2..(num - 1)).each do |n|
    return false if num % n == 0
  end
  true
end

def minimum_number(ary)
  total_sum = ary.sum
  next_prime = 0

  until is_prime(total_sum) # total_sum.prime? ## with ruby standard library
    total_sum += 1
    next_prime += 1
  end
  next_prime
end

# Alternative solution by Hunter
# require 'prime'

# def minimum_number(arr)
#   sum = arr.sum
#   extra_number = 0
#   loop do
#     return extra_number if sum.prime? == true
#     sum += 1
#     extra_number += 1
#   end
# end

p minimum_number([3, 1, 2]) == 1
p minimum_number([5, 2]) == 0
p minimum_number([1, 1, 1]) == 0
p minimum_number([2, 12, 8, 4, 6]) == 5
p minimum_number([50, 39, 49, 6, 17, 28]) == 2
