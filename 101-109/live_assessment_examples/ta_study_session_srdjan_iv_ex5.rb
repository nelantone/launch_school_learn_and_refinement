# Given integer array nums, return the third maximum number in this array. If the third maximum does not exist, return the maximum number.
# You are not allowed to sort the array

p third_max([3,2,1]) == 1
p third_max([1,2]) == 2
p third_max([2,2,3,1]) == 1
p third_max([1, 3, 4, 2, 2, 5, 6]) == 4

=begin
* Problem understanding:
  - Mental model:
    - return the third maximum number in this array
    - if does not exist return the max number

  - Input: array

  - Output: integer

  - Rules:
    - Explicit:
      - if there is no third number return the max number

    - Implicit:
      - if the numbers are repeated count as only one number
        * otherwise [2,2,3,1], will 2 the max number

  - Questions:

* Examples:

* Data Structure:
    - array?

* Algorithm:
  - Main Algorithm:
    iterate to the array of numbers
    - make uniq the list uf numbers
    - use max, find 3 times the max number
    - remove the 2 first max numbers
    - the 3 number is the one we look for.

  - Ideas:
    - use `next`

  - Higher Level Algorithm(helper methods):

* Code:
=end
def third_max(ary)
  return ary.max if ary.size < 3

  uniq_num_ary = ary.uniq
  result = 0

  3.times do |count|
    actual_max = uniq_num_ary.max
    result = actual_max

    uniq_num_ary.delete(actual_max)
  end
  result
end