4.Alphabet symmetry
(https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0)
7 kyu
=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b
is in position 2. In the alphabet, a and b are also in positions 1 and 2.
Notice also that d and e in abode occupy the positions they would occupy in
 the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy
 their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase.
No spaces.

Good luck!

If you like this Kata, please try:

Last digit symmetry

Alternate capitalization

=end

=begin
* Problem understanding:
  - Problem domain: none

  - Mental model:
    - from an array of strigns count each of the numbers who are in the correct
    alphabet position, returning the count.

  - Input: Array of strings

  - Output: Array of integers

  - Rules:
    - Explicit:
      - each letter correspnd a possition number:
        'a' = 1 ... 'z' = 26
      - Letters can be uppercase or lowercase.
      - There are no spaces
    - Implicit: none so far

  - Questions: None so far

* Examples:
  - ['abcd', 'Xb', 'z'] => [4,1,0]
* Data Structure:
 - Maybe a constant as base for the alphabet
* Algorithm:
  - initialize a Constant with alll the alphabet letters
  - initialize an empty array  where we are going to store the counts and
    result
  - pass each element of the array
  - we initialize each index at to zero.
  - from each element we take ach char an we compare with the index of our
    constant via the index. If in the same index the downcase letter is the same
    we count +1
* Code:
=end

ALPHA = ('a'..'z').to_a

def solve(array)
  result = []
  array.each_with_index do |letters_string, idx_at|
    result[idx_at] = 0
    downcase_letter_chars = letters_string.chars.map(&:downcase)

    downcase_letter_chars.each_with_index do |char, idx_char|
      result[idx_at] +=  1 if char == ALPHA[idx_char]
    end
  end
  result
end

# another approach

ALPHA = ('a'..'z').to_a

def solve(array)
  array.map.with_index do |letters_string|
    downcase_letter_chars = letters_string.chars.map(&:downcase)

    result = downcase_letter_chars.select.with_index do |char, idx_char|
       char == ALPHA[idx_char]
    end

    result.size
  end
end

p solve(['abcd', 'Xb', 'z'])
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
