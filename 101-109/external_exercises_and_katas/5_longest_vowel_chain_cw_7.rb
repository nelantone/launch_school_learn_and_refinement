# 5.Longest vowel chain
# (https://www.codewars.com/kata/59c5f4e9d751df43cf000035/train/ruby)
# 7 kyu
=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io. The longest of
these has a length of 2. Given a lowercase string that has alphabetic
characters only and no spaces, return the length of the longest vowel substring.
Vowels are any of aeiou.

* Problem understanding:
  - Promblem domain:

  - Mental model: return the length of the longest vowels together in a
      substring.

  - Input: lowercase string that has alphabetic
        characters only and no spaces

  - Output: integer

  - Rules:
    - Explicit:
      - vowels are defined here as `aeiou`
    - Implicit:/

  - Questions:/

* Examples:
  /
* Data Structure:
  - an array
* Algorithm:
  - find all consecutive vowels
    - let's fin all chars inside the string and make them separate chars with
      method `char`
    - we can find them using regular expression using it with method `split`
     then we want to split the non vowels /[^aeiou]/.
  - then we can map the result and return the length/size.
  - finally we can find the maximum size/length and return it as solution
* Code:
=end

def solve(str)
  str.split(/[^aeiou]/).map(&:size).max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
