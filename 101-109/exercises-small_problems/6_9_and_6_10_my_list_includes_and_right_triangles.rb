# Does My List Include This?
# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the
# array, false if it is not. You may not use the Array#include? method in
# your solution.

=begin
- Problem understanding
  - input: array and integer
  - output: boolean false/true
  - rules:
    - do not use Array#include?
    - nil counts like a value
    - empty array is not nil
- Examples(below)
- Data structure
    - iteration possibly an array helper
- Agorithm
  check if the value is present in the array
- Code
=end

def include?(array, value)
  array.each { |item| return true if item == value }
  false
end

include?([1, 2, 3, 4, 5], 3) == true
include?([1, 2, 3, 4, 5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

# Right Triangles
# Write a method that takes a positive integer, n, as an argument,
# and displays a right triangle whose sides each have n stars.
# The hypotenuse of the triangle (the diagonal side in the images below)
# should have one end at the lower-left of the triangle, and the other end
# at the upper-right.

=begin
- Problem understanding
  - input: positive integer n
  - output: string of n * n size forming a triangle from small to greater.
  - rules:
    - print shuld be nxn size
    - first line should have one `*`
    - last line should have `n` `*`
- Examples(below)
- Data structure
    - iteration possibly an array helper
- Agorithm
  - return n lines size of the n numbers
  - return n spaces in the line of n size
  - increase from the last character of the size one `*` for each line
- Code
=end

# Examples:

def triangle(num)
  num.times do |char|
    size = char + 1
    puts ((' ' * (num - size)) + ('*' * size)).to_s
  end
end

triangle(5)
# =>
#     *
#    **
#   ***
#  ****
# *****

triangle(9)
# =>
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# Further Exploration
# Try modifying your solution so it prints the triangle upside down from
# its current orientation.

def upsidedown_triangle_r(num)
  num.times { |char| puts ((' ' * (char)) + ('*' * (num - char))).to_s }
end

upsidedown_triangle_r(5)
# =>
# *****
#  ****
#   ***
#    **
#     *

# Try modifying your solution again so that you
# can display the triangle with the right angle at any corner of the grid

def triangle_l(size)
  size.times do |char|
    length = char + 1
    puts ((' ' * (size - length)) + ('*' * length)).to_s
  end
end

def triangle_r(size)
  size.times do |char|
    length = char + 1
    puts (('*' * length) + (' ' * (size - length))).to_s
  end
end

def upsidedown_triangle_l(size)
  size.times { |char| puts ((' ' * (char)) + ('*' * (size - char))).to_s }
end

def upsidedown_triangle_r(size)
  size.times { |char| puts (('*' * (size - char)) + (' ' * (char))).to_s }
end

def display_triangle(size, x, y)
  if     x ==  1 && y ==  1 then triangle_r(size)
  elsif  x == -1 && y ==  1 then triangle_l(size)
  elsif  x ==  1 && y == -1 then upsidedown_triangle_r(size)
  elsif  x == -1 && y == -1 then upsidedown_triangle_l(size)
  else p "not valid input, choose: size(+num), x & y axis integer (-1 or +1)"
  end
end

display_triangle(3, 1, 1)
display_triangle(3, -1, 1)
display_triangle(3, 1, -1)
display_triangle(3, -1, -1)
