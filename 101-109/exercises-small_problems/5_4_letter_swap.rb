# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.

# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

# Examples:

def swap(words_string)
  words_array = words_string.split.map do |word|
    last_char_index = - 1 # same as `word.size - 1`
    initial_char_in_zero_index = word[0]

    word[0] = word[last_char_index]
    word[last_char_index] = initial_char_in_zero_index

    word
  end
  words_array.join(' ')
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

# Oficial solution:

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

# Further Exploration
# How come our solution passes word into the swap_first_last_characters method invocation instead of just passing the characters that needed to be swapped? Suppose we had this implementation:

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end
# and called the method like this:

# swap_first_last_characters(word[0], word[-1])
# Would this method work? Why or why not?

# solution for further exploration:
# It would not work. We are using [] inside the string, and indexing is
# destructive, it will point tho the same original variable and will change the
# value but we initialize variable a  pointing to word[0], as we reassign
# it stops pointing to the same place in memory.
# We have the concept from `variable as a pointer`

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word[0], word[-1])
#     word
#   end
#   result.join(' ')
# end
