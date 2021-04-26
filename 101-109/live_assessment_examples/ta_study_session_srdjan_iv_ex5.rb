# Given integer array nums, return the third maximum number in this array. 
#If the third maximum does not exist, return the maximum number.
# You are not allowed to sort the array use `sort` , `sorty_by` or `max`.


# LONG
=begin
* Problem understanding:
  - Mental model: find the third greates number otherwise the maximum number

  - Input: array

  - Output: integer

  - Rules:
    - Explicit:
      - If the third maximum does not exist, return the maximum number.

    - Implicit:
      -  In case of repeated numbers we ignore the repetitions, we want the
      UNIQUE number.

* Examples:
  - [1, 2] return the max as there is not 3rd max => 2
  - [2, 2, 3, 1] => 1 (as 2 is repeated twice and we want the unique values)
* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - have unique elements inside the array and initialize the return value
    - guard clause is when the elements are equal less than 2.
      Then we sort the element and we take the first
    - compare the size with <=>, if  is +1 append the element on the right of the
      uniq_array otherwise append the element on the left.
    - Repeat the process.
    - once the process is over
    if the array size is greater than 2:
      - take the element at index 2 form ary_uniq.
    otherwise take the last item.


  - Higher Level Algorithm(helper methods):

* Code:
=end

def third_max(ary)
  ary_uniq = ary.uniq

  ary_uniq.each.with_index do |int, idx|
    unless ary_uniq[idx+1].nil?
      compare = ary_uniq[idx] <=> ary_uniq[idx + 1]
      compare == 1 ? ary_uniq << int : ary_uniq << ary_uniq[idx + 1]
      ary_uniq.uniq!
    end
  end

  ary_uniq.size <= 2 ? ary_uniq.last : ary_uniq[2]
end
p third_max([3, 2, 1])# == 1
p third_max([1, 2]) == 2
p third_max([2, 2, 3, 1]) == 1
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
# def third_max(ary)
#   return ary.max if ary.size < 3

#   uniq_num_ary = ary.uniq
#   result = 0

#   3.times do |_count|
#     actual_max = uniq_num_ary.max
#     result = actual_max

#     uniq_num_ary.delete(actual_max)
#   end
#   result
# end
