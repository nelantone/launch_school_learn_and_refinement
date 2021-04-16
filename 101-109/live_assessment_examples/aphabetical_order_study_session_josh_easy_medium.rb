# Write a method, `alphabetical?()` that takes a string and returns true if the
# characters in the string are in alphabetical order from left to right, and
# false otherwise. For instance, 'abc' would be true and 'zyx' is false.
# The method should be case insensitive and should ignore punctuation and numbers.
# Repeated consecutive characters may be treated as one character.

=begin
* Problem understanding:
  - Mental model:
    - write a method that returns true if the chars in the string are in
      alphabetical order from left to right. other wise return false.
  - Input: string

  - Output: boolean

  - Rules:
    - Explicit:
      - The method should be case insensitive and should ignore punctuation and numbers.
      - Repeated consecutive characters may be treated as one character.
    - Implicit:/

  - Questions:/

* Examples:

* Data Structure:
    - string
* Algorithm:
  - Main Algorithm:
    - initialize filtered_strin with the string with all letters downcased.
    - remove all special characters from the string.. regular expression?
      - see if it includes the character from the alphabeth
    - convert the stirng in individual chars, sort the result and join to
      convert again the array into a string.
    -  compare the result with the original array
  - Ideas:

  - Higher Level Algorithm(helper methods):

* Code:
=end

def alphabetical?(str)
  filtered_str = str.downcase.gsub(/[^a-z]/, '')
  filtered_str.chars.sort.join == filtered_str
end

p alphabetical?("abc") == true
p alphabetical?("AbC") == true
p alphabetical?("a.b_c?") == true
p alphabetical?("zyx") == false
p alphabetical?("Eggs") == true
p alphabetical?("hello") == false
