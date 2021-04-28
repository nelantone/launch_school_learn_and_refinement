# Given 2 strings, find out if there is a substring that appears in both strings.
# You will return true if you find a substring that appears in both strings or false
# if you do not.
# We only care about substrings that are longer than one letter long.

# LONG
=begin
* Problem understanding:
  - Mental model:
    - find out a substring that appears in both strings and return true if does,
    otherwise return false.

  - Input: strings

  - Output: booleand

  - Rules:
    - Explicit:
      - We only care about substrings that are longer than one letter long.
    - Implicit:
      - if there is a empty string should return false as there is no possible substring.
      - upcase version of downcase can be also a substring

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - initalize a new array results
    - find the smalles string and use it as reference (ref_Str)
    - find the smalles possible coincidence consecutive substrings
      (2 chars that are the same)
    - from the longest see if the smallest candidates are present.
      - if any is, return true, optherwise false.
    - return `true` if at least 2 chars are the same in both strings.


  - Ideas:
- from there make as big as possible the smallest of the two strings?

  - Higher Level Algorithm(helper methods):

* Code:
=end

def substring_test(str1, str2)
  longes_str, ref_str = '', ''

  if str1.size >= str2.size
    longes_str, ref_str = str1.downcase, str2.downcase
  else
    ref_str, longes_str = str1.downcase, str2.downcase
  end

  candidates = ref_str.chars.each_cons(2).to_a.map(&:join)

  candidates.any? { |candidate| longes_str.include?(candidate) }
end

p substring_test('Something','Fun') == false
p substring_test('Something','Home') == true
p substring_test('Something','') == false
p substring_test('', 'Something') == false
p substring_test('BANANA','banana') == true
p substring_test('Something','') == false
p substring_test('test','lllt') == false
p substring_test('1234567','541265') == true
p substring_test('supercalifragilisticexpialidocious','SoundOfItIsAtrociou') == true
