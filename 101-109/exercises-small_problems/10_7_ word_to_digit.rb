# Word to Digit
# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
# converted to a string of digits.

=begin
- Problem understanding:
  - mental model: transform numbers into letters inside a string
  - input: string
  - output: string
  - explicit rules:
    - it should return the same string *(we mutate the object)
    - other characters can be in the string
  - implicit rules:
    - the numbers are from zero to nine (no more than 1 digit numbers)
    - we don't know what to do when are already numbers. We will ignore them.

- Example(below)
- Data structure:
 - array of numbers
- Algorithm:
  - initialize a constant assigned to an array of written numbers
    from zero to nine.
  - split the string into words with the space between
  - from each word remove the non digit/letters characters
  - see if the word is included in the list if is included return the index
    related number
- Code:
=end

NUM_EN = %w(zero one two three four five six seven eight nine)

def word_to_digit(sentence)
  NUM_EN.each { |num| sentence.gsub!(/\b#{num}\b/, NUM_EN.index(num).to_s) }

  sentence
end

# def word_to_digit(sentence)
#   sentence.split(' ').map do |word, idx|
#     word_partition = word.partition(/[^a-z]/i)
#     filter_word, special_char = word_partition[0], word_partition[1]
#     str_integer = NUM_EN.index(filter_word).to_s

#     if NUM_EN.include?(filter_word)
#       str_integer + special_char
#     else
#       filter_word + special_char
#     end
#   end.join(' ')
# end

def is_integer?(str)
  str.to_i.to_s == str
end

def phone_filter(numb)
  numb.size == 10 ? numb = "(#{numb[0, 3]}) #{numb[3, 3]}-#{numb[6, 4]}" : numb
end

# or
def word_to_digit(sentence)
  numb = ''

  NUM_EN.each { |num| sentence.gsub!(/\b#{num}\b/, NUM_EN.index(num).to_s) }

  sentence.chars.each { |char| numb << char if is_integer?(char) }

  sentence.gsub!(/\d.*\d/, phone_filter(numb))
  sentence.downcase!
end

# Example:
words = 'Please call me at five five five one two one four five five five. Thanks.'
word_to_digit(words)
# => "please call me at (555) 121-4555. thanks."
words
# => "please call me at (555) 121-4555. thanks."
