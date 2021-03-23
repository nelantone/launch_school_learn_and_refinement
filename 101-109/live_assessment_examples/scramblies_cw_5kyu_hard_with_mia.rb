=begin
22. Scramblies
(https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)
5 kyu
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
(Input strings s1 and s2 are nil terminated?)

---------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs:
    - 2 strings
  Outputs:
    - boolean true/false
Rules/Implicit Requirements
  - strings are all lowercase letters (no puntuation, spaces etc..)
  - we return `true` if `string 1` contains the same      leteters and the same amount of those letters on   `string 2`.
  -
Clarifying Questions
  - `Input strings s1 and s2 are nil terminated?`
Mental Model (optional)
  -

EXAMPLES/TEST CASES
  p scramble('hi', 'ih') == true
  p scramble('i', 'hi') == false

DATA STRUCTURE
  Inputs
    -
  Rules
    - array, loop

ALGORITHM
  - check the size of str1 & str2, if str1 size < str2 size return false
  - create a copy of str1/use pass by value for args
  - take each character of str2, see if str1 contains this char
    - if it does, remove the char from str1
    - if it doesn't, return false
  - repeat the process of checking char in str2 until the last char of str2 is reached
=end


=begin
REGEX idea
- each char of a string present at least once 
- e.g., char A and char B and char C

(?=.*w)(?=.*o)(?=.*r)(?=.*l)(?=.*d)


=end

def scramble(str1, str2)
  return false if str1.size < str2.size

  arr = str1.chars

  str2.each_char do |char|
    if arr.include? char
      index_at = arr.index(char)
      arr.delete_at(index_at)
    else
      return false
    end
  end
  true
end

p scramble('hi', 'ih') == true
p scramble('i', 'hi') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

# Try to make it more efficient
# regular expressions?
# str1.scan(/[#{str2}]/).size >= str2.size