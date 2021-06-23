# Given an array of integers, return indices of the two numbers such that they
# add up to a specific target.
# You may assume that each input would have exactly one solution, and you may
# not use the same element twice.
# Example:

# Given nums = [8, 2, 11, 15, 7], target = 9, [1, 4]
# array[0, 1, 2, 3, 4, 5, 6], target = 5, returns [2, 3]

=begin
x=begin
* Problem understanding:
  - Mental model:
    giving an array of numbers and a target number, return the 2 numbers
    combination indexes that adding them return the target-number.
  - Input: array, integer

  - Output: 2 pairs num array

  - Rules:
    - Explicit:
      - there is only one possible solution
      - you may not use the same element twice

    - Implicit:
      - num can be negative?

  - Questions:
   - num can be negative?

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - find the sum of all possible pairs(whihtout using the same number)
    - find out the only pair that gives the result then return the indexes
  - Ideas:
    - use combinations
  - Apporach:
    - use combinations in pairs
    - from each subarray do the sum
    - when we find out the sum find the numbers
    - in case is the same number


  - Higher Level Algorithm(helper methods):

* Code:
=end
def second_idx_with_same_num(ary, elem, index_at)
  new_subary         = ary[(index_at+1)..-1]
  new_idx_at         = new_subary.index(elem)
  first_idx_counting = ary.size - new_subary.size

  first_idx_counting + new_idx_at
end

def sum_finder(ary, num)
  index_result = []
  num_result = ary.combination(2).select {|subary| subary.sum == num  }

  num_result.first.map do |elem|
    index_at = ary.index(elem)
    if index_result.include? index_at
      index_result << second_idx_with_same_num(ary, elem, index_at)
    else
      index_result << ary.index(elem)
    end
  end
  index_result
end

p sum_finder([8, 2, 11, 15, 7], 9) == [1, 4]
p sum_finder([0, 1, 2, 3], 5) == [2, 3]
p sum_finder([-3, 6], 3) == [0,1]
p sum_finder([0, 1, 2, 3, 6], 5) == [2, 3]
p sum_finder([9, 4, 1, 6, 4], 8) == [1, 4]
p sum_finder([0, 4], 4) == [0, 1]
p sum_finder([4, 3, 5], 8) ==  [1, 2]

=begin
def find_pair(arr, target)
  combinations = arr.combination(2).to_a
  matches = combinations.select do |sub_arr|
    sub_arr.sum == target
  end
  p matches.last
  something = matches.last.map do |number|
    arr.index(number)
  end
  p something
end
=end