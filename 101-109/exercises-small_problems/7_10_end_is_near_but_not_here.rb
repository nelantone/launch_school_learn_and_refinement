# Write a method that returns the next to last word in the String passed to
# it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# Examples:

def penultimate(string)
  string.split[-2]
end

# further exploration
# if there is no word should be and empty string the same as an empty string
def penultimate(string)
  words = string.split

  return '' if words.size < 2

  words[-2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
penultimate('') == ''
penultimate('hi') == ''

def middle_word(string)
  words = string.split
  middle_index = words.size / 2

  return '' if words.size <= 2 || words.size.even?

  words[middle_index]
end

middle_word('Launch School is great!') == ''
middle_word('the middle word') == 'middle'
middle_word('no middle') == ''
penultimate('') == ''
penultimate('hi') == ''
