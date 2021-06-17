=begin
Write a function that takes an array of numbers (integers for the tests) and a
target number. It should find two different items in the array that, when added
together, give the target value. The indices of these items should then be
returned in a tuple like so: (index1, index2).

For the purposes of this kata, some tests may have multiple answers; any valid
solutions will be accepted.

The input will always be valid (numbers will be an array of length 2 or
greater, and all of the items will be numbers; target will always be the sum
of two different items from that array). */


console.log(twoSum([1, 2, 3], 4));              // [0, 2]
console.log(twoSum([1234, 5678, 9012], 14690)); // [1 ,2]
console.log(twoSum([2,2,3], 4));                // [0, 1]
=end

=begin
* Problem understanding:
 - Mental model:
  - find the combination of 2 numbers that added give the target value and return the indexes

  - Input: array, integer

  - Output: array

  - Rules:
    - Explicit:
        - we look for 2 numbers and the ouput is an array size-2

    - Implicit:
      - we can't repeat the same `index_at`

  - Questions:

* Examples:


* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - sum all possible combinations of 2 numbers
    - when the sum is equal to the target value find the specific indexes

  - Ideas:

#   - Apporach:
#     + init result_indexes array
#     + init result_sum
#     - find the possible combinations of numbers and append them into candidates*
#     - sum the numbers
#     - when the num is equal than the target reassign comb number to result_sum
#     - when there are equal the target find the specific numbers with index
#     - IF is the same number find the next index number * helper method?
#     ** - add helper method for same number.
#     - return the result_index array

  - Higher Level Algorithm(helper methods):
    - pair_indexes_of_same_number
      - iterating thourgh all elemnts and find the index at from the specficic num(twice) and append in an array

* Code:

UNDERSTAND THE PROBLEM
  Inputs
    - two inputs
      - 1st: an array of 2 or more numbers
      - 2nd: a number (target sum)
  Outputs
    - an array of exactly 2 numbers representing the indexes of the two numbers that add up to the target sum
Rules/Implicit Requirements
  - Assume that there will always be two numbers from the input array that add up to the target sum
  - The numbers do not have to be consecutive elements
  - The numbers in the input array are all positive (> 0)
  - We're only dealing with numbers (no strings) in an array
Clarifying Questions
  -
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    - array
  Rules
    - hash for the two numbers that add up to the sum

ALGORITHM
  - define a "reference" hash to keep track of the numbers that add up to the sum
  - iterate through the input array (over the elements and indices)
  - find the difference between the target sum and the current element
  - look in the reference hash to see if it contains a key corresponding to the difference
    - store the current element and the difference as a key value pair in the hash IF
    the hash keys do not contain the difference
      - key: current element, value: index
    - otherwise (the difference is a key in the hash) return the value of the key (index) and the index of the current element
    - O(N)
=end


# def pair_indexes_of_same_number(ary, same_num)
#   result = []
#   idx = 0
#   until result.size == 2
#     result << idx if ary[idx] == same_num
#     idx += 1
#   end
#   result
# end

# p pair_indexes_of_same_number([2,2,3], 2) == [0,1]

# def twoSum(ary,target)
#   result_idxs = []
#   result_sum  = nil

#   ary.combination(2) { |comb| result_sum = comb if comb.sum == target }

#   if result_sum.uniq.size == 1
#     same_num = result_sum.first
#     return pair_indexes_of_same_number(ary, same_num)
#   else
#     result_sum.each { |num| result_idxs << ary.index(num) }
#   end

#   result_idxs
# end

# # p twoSum([1, 2, 3], 4)              == [0, 2]
# # p twoSum([1234, 5678, 9012], 14690) == [1 ,2]
# # p twoSum([2,2,3], 4)                == [0, 1]

# // O(N^2)
# // O(N)

# function twoSum(arr, sum) {
#   let ref = {}; // object => Array, Simple Object (hash), Dates, JSON
#   let diff;

#   for(let i = 0; i < arr.length; i += 1) {
#     diff = sum - arr[i];
#     if (ref[diff] !== undefined) {
#       return [ref[diff], i];
#     } else {
#       ref[arr[i]] = i;
#     }
#   }
# }

# console.log(twoSum([1, 2, 3], 4));              // [0, 2]
# console.log(twoSum([1234, 5678, 9012], 14690)); // [1 ,2]
# console.log(twoSum([2,2,3], 4));                // [0, 1]

# def pair_indexes_of_same_number(ary, same_num)
#   result = []
#   idx = 0
#   until result.size == 2
#     result << idx if ary[idx] == same_num
#     idx += 1
#   end
#   result
# end

# def twoSum(ary,target)
#   result_idxs = []
#   result_sum  = nil

#   ary.combination(2) { |comb| result_sum = comb if comb.sum == target }

#   if result_sum.uniq.size == 1
#     same_num = result_sum.first
#     return pair_indexes_of_same_number(ary, same_num)
#   else
#     result_sum.each { |num| result_idxs << ary.index(num) }
#   end

#   result_idxs
# end

# Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple like so: (index1, index2).

# For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

# The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).

# My solution using nested-loop-combinations

def two_sum(arr, target)
  max_idx = arr.size-1

  (0..max_idx).each do |first_idx|
    next_start_idx = first_idx + 1

    (next_start_idx..max_idx).each do |second_idx|
      combination = [arr[first_idx], arr[second_idx]].sort

      return [first_idx, second_idx]  if combination.sum == target
    end
  end
end

p two_sum([2,2,3],4) == [0,1]
p two_sum([1234, 5678, 9012], 14690) == [1 ,2]
p two_sum([2,2,3], 4) == [0, 1]

#[0, 1], [0,2]
#[1,2]
