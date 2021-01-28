# Combine Two Lists
# Write a method that combines two Arrays passed in as arguments, and returns
# a new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

# Example:
=begin
- Problem
  - input: 2 arrays
  - output: 1 array combination
  - rules:
    - new array should contain all arguments altered

- Examples (below)
- Data struc
  - probably new array helper
- Algorithm
  - do a nested array with both arrays.
  - passthe first item of the first array
  - pass the first item of the second array

- Code
=end
def interleave(first_ary, second_ary)
  ary_new = []

  first_ary.each_with_index do |element, idx|
    ary_new << element << second_ary[idx]
  end

  ary_new
end

# or
def interleave(first_ary, second_ary)
  first_ary.zip(second_ary).flatten
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
