# Welcome Stranger
# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, :title and
# :occupation, and the appropriate values. Your method should return a greeting
# that uses the person's full name, and mentions the person's title and
# occupation.

# Example:

def greetings(full_name, prof_info)
  "Hello, #{full_name.join(' ')}! Nice to have a #{prof_info[:title]}
    #{prof_info[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# "Hello, John Q Doe! Nice to have a Master Plumber around."

# Double Doubles
# A double number is a number with an even number of digits whose left-side
# digits are exactly the same as its right-side digits.
# For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433,
# and 107 are not.

# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned
# as-is.

# Examples:

def twice(num)
  num_s = num.to_s
  mid_idx = num_s.size / 2

  return num if num_s.size.even? && (num_s[0...mid_idx] == num_s[mid_idx..-1])
  num * 2
end

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

#  Note: underscores are used for clarity above. Ruby lets you use underscores
#  when writing long numbers; however, it does not print the underscores when
#  printing long numbers. Don't be alarmed if you don't see the underscores
#  when running your tests.

#####

# Always Return Negative
# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number. If the number is 0
# or negative, return the original number.

# Examples:

def negative(num)
  num.positive? ? - num : num
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0 # There's no such thing as -0 in ruby

# Counting Up
# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is
# greater than 0.

# Further Exploration
# Food for thought: what do you think sequence should return if the argument
# is not greater than 0. For instance, what should you do if the argument is -1?
# Can you alter your method to handle this case?

# Examples:
def sequence(num)
  num.positive? ? (1..num).to_a : (num..0).to_a
end

sequence(0) == [0, 1]
sequence(-2) == [-2, -1, 0, 1]

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]


# Uppercase Check
# Write a method that takes a string argument, and returns true if all of
# the alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.

# Further Exploration
# Food for thought: in our examples, we show that uppercase? should return true
# if the argument is an empty string. Would it make sense to return false
# instead? Why or why not?

# Examples:

def uppercase?(str)
  str.empty? ? false : str.upcase!.nil?
end

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == false