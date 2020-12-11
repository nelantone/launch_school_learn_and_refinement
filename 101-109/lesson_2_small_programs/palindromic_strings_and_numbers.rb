=begin
PEDAC
- Problem understanding: (have time to process the problem)
Write a method that returns true if the string passed as an argument is a
palindrome, false otherwise. A palindrome reads the same forward and backward.
For this exercise, case matters as does punctuation and spaces
  - problem domain:
    palindrome: palindrome reads the same forward and backward.
    Alphanumeric char: 
  - define input/output
    input: string
    output: boolean
  - Make implicit requirements explicit:/
  - list new rules:
    - case in-sensitive
    - It should ignore all non-alphanumeric characters
  - clarify doubts: /
  - mental model:
    full word should be the same written from the beginning from the end.
- Examples & test
  real_palindrome?('madam') == true
  real_palindrome?('Madam') == true           # (case does not matter)
  real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
  real_palindrome?('356653') == true
  real_palindrome?('356a653') == true
  real_palindrome?('123ab321') == false
- Data structure: Add th sutrucutre of data we will use
  we might be using an array. But maybe even we don't need.
- Algorithm: Steps of how to solve the problem
  modify the object of the argument changing the order of each word passing each
  first word to the last. then compare this new object string to the initial one.
  In case is the same make it equal to true.(don't take in count upcase, space and
  shuould ignore all non-alpha numeric characters). when is true  return true,
  else false as output.
- Code: Algorithm implementation.
=end

def palindrome?(input)
  input.reverse == input
end

def real_palindrome?(input)
  input = input.downcase.delete('^a-z0–9')
  input.reverse == input
end

def reversing_number_octal_remover(integer)
  integer_s = integer.to_s
  if integer.to_s.end_with?('0')
    integer_s = integer_s.gsub(/0.$/,'')
    integer_s == integer_s.reverse
  end
end

def palindromic_number?(integer)
  integer == integer.to_s.reverse.to_i
end

#or
def palindromic_number2?(number)
  palindrome?(number.to_s)
end

# examples for this case
p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(02120) == false
