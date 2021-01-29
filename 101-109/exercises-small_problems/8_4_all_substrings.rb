# All Substrings
# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on. Since multiple
# substrings will occur at each position, the substrings at a given position
# should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in
# the previous exercise:

# Examples:
def leading_substrings(string)
  index_size = string.size - 1

  (0..index_size).map { |idx| string.chars[0..idx].join('') }
end

# def substrings(string)
#   result = []
#   current_size = 0

#   loop do
#     sliced_string = string[current_size..string.size]

#     result << leading_substrings(sliced_string)

#     current_size += 1

#     break if current_size == string.size
#   end

#   result.flatten
# end

# or

def substrings(string)
  (0..string.size).map do |current_size|
    sliced_string = string[current_size..string.size]

    leading_substrings(sliced_string)
  end.flatten
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
