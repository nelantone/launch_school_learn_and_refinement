# Reversed Arrays (Part 1)

# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed into this method. The return value
# should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

=begin
- Problem understanding.
 - Mental model:
  - We want to exactly inverse the order of each characters string(when is
  a single char should be the same)

  - input: array

  - output: only array!

  - rules:
    - output is an array, always
    - object_id should be the same (we mutate the caller)
    - the array can have 1 object or be empty.

- Examples (below)

- Data structure:
  - Arrays

- Algorithm:
  - Take each object collection to remove it and add it in front.
  iterate until last char size. Problem. Is not a good practice to mutate the
  array while iteraring also we need to stop in the middle of the iteration.
  Otherwise we will re-write the results.

  Possible solution: don't reassign/delete/create each object and sort
  it somehow as `#sort` or `#stor_by`. As `#sort!` uses teh spaceship operator
  `<=>`... and we have the clear concept of both methods this can be the one.
  We want to sort the inverse index we want find the index related to each
  object and then return the index.

  1. we use #sort (is using already spaceship operator)
  2. we use #index with passing `b` object and `a` objects as callers in `<=>`
    - as `index(a)` should give us the index value it show us the index number.
      From the number we sourt in the inverse way as it is (this is why `b` is
      on the left and `a` on the right)

- Code
=end

def reverse!(array)
  array.sort! { |a, b| array.index(b) <=> array.index(a) }
end

# or
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1, 2, 3, 4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

# Note: for the test case list = ['abc'], we want to reverse the elements
# in the array. The array only has one element, a String, but we're not
# reversing the String itself, so the reverse! method call should return
#  ['abc'].

# Reversed Arrays (Part 2)
# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method
# you wrote in the previous exercise.

# Examples:

def reverse(ary)
  ary.sort { |left, right| ary.index(right) <=> ary.index(left) }
end

# Further Exploration
# An even shorter solution is possible by using either inject or
# each_with_object. Just for fun, read about these methods in the Enumerable
# module documentation, and try using one in your reverse method.

def reverse(ary)
  ary.each_with_object([]) { |item, ary| ary.unshift(item) }
end

# instead `#each_with_object` we can also use `#reduce` or `#inject`
# * The inject and reduce methods are aliases

reverse([1, 2, 3, 4]) == [4, 3, 2, 1] # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
