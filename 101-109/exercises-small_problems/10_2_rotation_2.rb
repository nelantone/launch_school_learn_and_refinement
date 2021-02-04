# Rotation (Part 2)
# Write a method that can rotate the last n digits of a
# number.

# Note that rotating just 1 digit results in the original
# number being returned.

# You may use the rotate_array method from the previous
# exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

=begin
Problem understanding:
Rotate an specific number starting from the right
first argument is the number itself
second argument is the inverse index position starting
from 1(not form zero!)
so (123`4`5, 2) will move the number `4` to the last position
=> 1235`4`
(1`2`345, 4) will move `2` to the last position
=> 1345`2`
and so on...

- input: integer number, ineteger as pointing order
- output: integer number

- rules:
  - rotating just 1 digit result
  - n is always positive integer

- recommendations:
  use previous method

Examples(below):

Data structure:

Algorithm:
- Use rotate array as example(specific case of (735291, 6)
- as we see rotate array is using an array, we need to convert
`number` as an array of n numbers in the same order to use
#rotate_array
- once converted, then convert the array result as numbers again
- Change #shift method to delete_at, as -1 will be the last index
we can use - last digit as number and with delete at move the specific
item to the end.

Code:
**
My solution is modifying #rotate_array renaming it to #rotate_array_at
as more general use adding an extra argument last_n_digit and using #delete_at instead #shift.

=end

# For example:

def rotate_array_at(ary, last_n_digit)
  new_ary = ary.dup
  new_ary << new_ary.delete_at(- last_n_digit)
end

def rotate_rightmost_digits(number, last_n_digit)
  ary = number.to_s.split('').map(&:to_i)
  rotate_array_at(ary, last_n_digit).join.to_i
end


rotate_rightmost_digits(735291, 6) == 352917
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
