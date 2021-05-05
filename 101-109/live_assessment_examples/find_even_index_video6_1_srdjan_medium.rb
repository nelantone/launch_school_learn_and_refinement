# You are given an array of integers. Your job is to take tha array and find
# and index N where the sum of the integers to the right of N. If there is no
# index that would make this happen. return -1.

# For example:

# Let's say you are given teh array [1,2,3,4,3,2,1]
# your method will return the index 3 because art the 23rd possition of the array
# the sum of the ledt side of the index [1,2,3] and the sum of the right side of
# the index [1,2,3] both equal 6.

# Another one:
# [20,10,-80,10,10,15,35]
# They both are equal to 0 when added. (Empty arrays are eql to 0 on this problem)
# Index 0 is the place where the left side and right side are equal.



=begin
* Problem understanding:
  - Mental model:
    - return the index at where left and right side of the array is equal(gives 0 as result)

  - Input: array

  - Output: integer

  - Rules:
    - Explicit:
       - If there is no index that would make this happen. return -1.

    - Implicit:
      - numbers can also be negative
      - we don't count the index at for the operation
    - Questions?
      -is there only one possible 0 total of the array sums?

* Examples:
[1,2,3,4,3,2,1] ->              (1,2,3) [4] -(3,2,1) => 0
[20,10,-80,10,10,15,35] ->      [20] (10,-80,10,10,15,35) => 0
[10, -80, 10,10, 15,35, 20]) -> (10, -80, 10,10, 15,35) [20] => 0

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    + create a subarray starting from left to right.
      + left_sub
      and another case from right to left.
      + right_sub
      => [1,2,3,2,1] -> index at 1 => [1] <2> -[3 2 1] != 0
                                      ary[0...1]   <2>      ary[2..4]
                     -> index at 2 => [1,2] <3> -[2, 1] == 0 => true
                                     ary[0...2]   <3>    ary[3..4]
      + we do a division from both methods, when is 0 we return the index
      + repeat the subarray proces util the result is 0, then return index at x

  - Ideas:
    - from 0 to n size of the array. do sum of the numbers not using the index at number
    - we can do as default left to right substraction for example

  - Higher Level Algorithm(helper methods):
    -

* Code:
=end

def left_sum(ary, idx_at)
  ary[0...idx_at].sum
end

def right_sum(ary, idx_at)
  ary_idx_last = ary.size - 1

  ary[idx_at+1..ary_idx_last].sum
end

def find_even_index(ary)
  ary.each_index { |idx| return idx if left_sum(ary, idx) == right_sum(ary, idx) }
  -1
end

p right_sum([1,2,3,2,1], 1) == 6
p right_sum([1,2,3,2,1], 2) == 3
p left_sum([1,2,3,2,1], 0)  == 0
p left_sum([1,2,3,2,1], 2)  == 3
p find_even_index([1,2,3,2,1]) == 2
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10, -80, 10,10, 15,35, 20]) == 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
