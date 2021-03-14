# Multiplicative Average
# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

# Examples:

def show_multiplicative_average(array)
  result = format('%.3f', (array.inject(:*) / array.size.to_f))

  "The result is #{result}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Multiply Lists
# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of
# each pair of numbers from the arguments that have the same index.
# You may assume that the arguments contain the same number of elements.

# Examples:
=begin
- Problem understanding:
  2 arguments, multiply same index numb and create a 3rd array with the
  result as same index.
  - input: 2 arrays
  - output: 1 array

  - rules:
    - array.size is the same for all the arrays.
- Example below

- Data struct:
  - array

- Algorithm:
  - use array_1 to zip array_2
  - as zip add the as same index pairs in one nested array, we will iterate
   each pair with map (as we want to return a new array)
  - inside the block we want the total product of each array object.
  - we return the #map new array.

- Code:

=end

def multiply_list(ary_1, ary_2)
  ary_1.zip(ary_2).map { |ary| ary.inject(:*) }
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Multiply All Pairs
# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of
# every pair of numbers that can be formed between the elements of the
# two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

=begin
- Problem understanding:
  - mental model:
   2 arrays, have the result of the product in every possible combination
   sort the results in a new array in increassing value.

   - input: 2 ary
   - ouput: 1 ary
   - rules:
    - no inputs as empty array

- Example below
- Data struct:
  - new array
- Algorithm:
  use arr1 as a base
  multiply arr1 index 1 to each of the index2 objects
  do the same with arr1 index 2
  save all values in an array sort the arry from smaller to greater
- Code
=end

def multiply_all_pairs(ary_1, ary_2)
  ary_1.product(ary_2).map { |a| a.reduce(:*) }.sort
end

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
