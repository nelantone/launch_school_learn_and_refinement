=begin
PEDAC
- Problem understanding: (have time to process the problem)
Write a method that returns true if the string passed as an argument is a
palindrome, false otherwise. A palindrome reads the same forward and backward.
For this exercise, case matters as does punctuation and spaces
  - problem domain:
    palindrome: palindrome reads the same forward and backward.
  - define input/output
    input: string
    output: boolean
  - Make implicit requirements explicit:/
  - list rules:
    - case sensitive
    - puntuation and spaces are counting to
  - clarify doubts: /
  - mental model:
    full word should be the same written from the beginning from the end.
- Examples & test
  palindrome?('madam') == true
  palindrome?('356653') == true
  -find edge cases
  palindrome?('Madam') == false          # (case matters)
  palindrome?("madam i'm adam") == false # (all characters matter)
- Data structure: Add th sutrucutre of data we will use
  we might be using an array. But maybe even we don't need.
- Algorithm: Steps of how to solve the problem
  modify the object of the argument changing the order of each word passing each
  first word to the last. then compare this new object string to the initial one.
  In case is the same make it equal to true.(take in count upcase, space and
  every character). when is true  return true, else false as output.
- Code: Algorithm implementation.
=end

def palindrome?(input)
  input.reverse == input
end




