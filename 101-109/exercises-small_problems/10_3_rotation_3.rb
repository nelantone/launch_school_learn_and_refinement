# Rotation (Part 3)
# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining
# digits, you get 32 9175. Keep the first 2 digits fixed in place and rotate
# again to 321 759. Keep the first 3 digits fixed in place and rotate again to
# get 321597. Finally, keep the first 4 digits fixed in place and rotate the
# final 2 digits to get 321579. The resulting number is called the maximum
# rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the
# rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.
=begin
Problem understanding:

iterate and rotate, in each rotation make +1 fixed number *(without counter)

input: number
output: number

-rules:
 - each iteration +1 index blocked later reversin the next number
 - times as size of then serie
 - starts with on fixed number, ends with one non fixed number

recomendation:  use all methods before

Examples(below):
Example splitted
735291

time. fixed-num pending reversed
0. 735291
1. 3 5291 7
2. 32 91 75
3. 321 759
4. 3215 97
5. 32157 9

Data structure:

Algorithm:
 on `0.` we use rotate_rightmost_digits to have `1.`
 then we can convert to array of integers for each digit
 on `1.` we save `3` to the final result and we can remove it from the array.
 then we rotate `5291 7` whithout the `3`.
 on `2.` we save integer `2` to the final result` and so on

=end

def rotate_array(ary)
  new_ary = ary.dup
  new_ary << new_ary.shift
end

def max_rotation(number)
  ary_digits = number.to_s.chars
  result = []

  until ary_digits.empty?
    ary_digits = rotate_array(ary_digits)

    result << ary_digits.shift
  end

  result.join.to_i
end

# Example:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
max_rotation(10005)
