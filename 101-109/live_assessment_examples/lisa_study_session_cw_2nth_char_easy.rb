# Complete the function that takes an array of words.
# You must concatenate the nth letter from each word to construct a new word which
# should be returned as a string, where n is the position of the word in the list.

# For example:
# ["yoda", "best", "has"]  -->  "yes"
#   ^        ^        ^
#   n=0     n=1     n=2
# Note: Test cases contain valid input only - i.e. a string array or an empty array; and
# each word will have enough letters.

=begin
* Problem understanding:
  - Problem domain:

  - Mental model:

  - Input: an array of string words

  - Output: string

  - Rules:
    - Explicit:
      -  we returned as a string based on the n index taking it as a index_at n from the strign element inside the array
      - there are no weird cases,
      - when is a n empty array we return an empty str
    - Implicit:
      -

  - Questions:

* Examples:

* Data Structure:
    - sting

* Algorithm:
  - Main Algorithm:
    - intialize a value with emtpy string
    - iterate to each element of the given array
    - take each n at index of the element. based on index position of the elment inside the array
  - Ideas:

  - Higher Level Algorithm(helper methods):

* Code:
=end

def nth_char(ary_words)
  result = ''

  ary_words.each_with_index do |word, idx|
    result << word[idx]
  end

  result
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'
