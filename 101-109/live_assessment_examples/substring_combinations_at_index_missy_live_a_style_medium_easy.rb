=begin
* Problem understanding:

  - Mental model:
    - Problem domain:
    find all possible different size/chars combinations from a    given string.

  - Input: string

  - Output: array

  - Rules:
    - Explicit:
      - returned list should be ordered by where in the string the substring begins
      - all substrings that start at position 0 should come first, then
      -  should be returned in order from shortest to longest based in the start at index on size `1` and continueninguntil string size..

    - Implicit:
          - the element need to have at least one of the chars.

  - Questions:

* Examples:

* Data Structure:
  Inputs
    -
  Rules
* Algorithm:
  - Main Algorithm:
    - intitialize a new array
    - use the full string, and starting from the index at zero, increment the size of the string.

  - Ideas:
    - find the combinations strating from index at 0 changing the string-size, from smaller to string.size.

  - Higher Level Algorithm(helper methods):
    - return combinations at in specific index

* Code:
=end

def size_combinations_at_index(str, index)
  result = []
  (str.size - index).times do |size|
    result << str[index, size + 1]
  end
  result
end

def substrings(str)
  result = []
  (str.size).times do |count|
    result << size_combinations_at_index(str, count)
  end
  result.flatten
end

# p size_combinations_at_index('hi!', 0)
# p substrings('abcde')
# p substrings('abc')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
