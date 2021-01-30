# Palindromic Substrings
# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be
# arranged in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous
# exercise.

# For the purposes of this exercise, you should consider all characters
# and pay attention to case; that is, "AbcbA" is a palindrome, but neither
# "Abcba" nor "Abc-bA" are. In addition, assume that single characters are
# not palindromes.
=begin
- Problem understanding:
  return al substrings that are palindrome(same sequence of chars forward and
  bakward)
  -input: string
  - output: array
  -rules:
    - return value should be arranged in the same appear sequence
    - duplicated palindromes should be included
    - palindromes are case sensitive
    - single chars are not palindromes

- Examples(below)
- Data structure:
  - array
- Algorithm:
  - use #substrings method to have all possible combinations
  - in all the combinations iterate selecting the ones are palindrome
    - use the #middle_word method first to select palindrome candidates
    - for the candidates
- Code
=end

def leading_substrings(string)
  index_size = string.size - 1

  (0..index_size).map { |idx| string.chars[0..idx].join('') }
end

def substrings(string)
  (0..string.size).map do |current_size|
    sliced_string = string[current_size..string.size]

    leading_substrings(sliced_string)
  end.flatten
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

def palindromes(string)
  filtered_string = string.gsub(/[^a-z]/i, '').downcase

  candidates = substrings(filtered_string)

  candidates.select { |candidate_str| palindrome?(candidate_str) }
end

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

palindromes('#$%MAdam') == ['madam', 'ada']

# Further Exploration
# Can you modify this method (and/or its predecessors) to ignore
# non-alphanumeric characters and case? Alphanumeric characters are alphabetic
# characters(upper and lowercase) and digits.
