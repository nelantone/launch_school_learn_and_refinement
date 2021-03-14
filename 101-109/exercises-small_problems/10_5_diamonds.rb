# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may
# assume that the argument will always be an odd integer.

=begin
- Problem understanding:
  - display a 4 pointed diamond. with n x n grid.
  - input: odd number
  - output: * n x n diamonds
  -rules: argument will be always an odd integer
- Example:
Examples

diamond(1)
#*
diamond(3)

# *
#***
# *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
- Data structure:
- Algorithm:
  - create an n x n the central part should contain n *
  - first and last row are 1 always other numbers are increasing or decreasing
- Code:
 start on line 1 with *
 - add next odd char in each line
 - finish adding * on the half.
 - then start decreasing
=end

def print_row(stars_ary)
  stars_ary.each do |stars|
    left_side = ' ' * ((stars_ary.size - stars) / 2)

    puts left_side + '*' * stars
  end
end

def diamond(odd_num)
  growing_stars = 1.upto(odd_num).select(&:odd?)
  decreasing_stars = (odd_num - 2).downto(1).select(&:odd?)
  stars_ary = growing_stars + decreasing_stars

  print_row(stars_ary)
end

# 3Further Exploration
# Try modifying your solution or our solution so it prints only the outline of the diamond:
def print_row(stars_ary)
  stars_ary.each do |stars|
    left_side = ' ' * ((stars_ary.size - stars) / 2)
    right_side_outline = stars > 1 ? ("#{' ' * (stars - 2)}*") : ''

    puts "#{left_side}*#{right_side_outline}"
  end
end

def diamond_outline(odd_num)
  growing_stars = 1.upto(odd_num).select(&:odd?)
  decreasing_stars = (odd_num - 2).downto(1).select(&:odd?)
  stars_ary = growing_stars + decreasing_stars

  print_row(stars_ary)
end

diamond_outline(5)

# *
# * *
# *
