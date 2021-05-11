# 16. Stop gninnipS My sdroW!
# (https://www.codewars.com/kata/5264d2b162488dc400000001)
# Write a function that takes in a string of one or more words, and returns the
# same string, but with all five or more letter words reversed (like the name of this kata).

# Strings passed in will consist of only letters and spaces.
# Spaces will be included only when more than one word is present.

=begin
- Problem understainding:
  - mental model:
    form a string reverse each word that is greater or equal 5
  - input: str
  - output: str

  - restrictions
    - explicit:
      - only letters ans spaces
    - implicit
  - Examples:

  - Data struct:
    -array

  - Algoritm:
      - Main algorithm
        -- iterate over each word
      -- check if the length of the word is equal or greater than 5
      -- if yes, reverse it

    - Implemntation
    + initiitalize an array `words`
    + split the string in words(by spaces)
    + iterate each elem/word and count the size of the word
      + if the word is eql or greater tha 5 rever the word
      + append each word to the words array
      +join the array addins spaces on each element
    - Code:
=end
def spin_words(str)
  ary_spin_words = str.split.map do |word|
    word.reverse! if word.size >= 5
    word
  end
  ary_spin_words.join(' ')
end

p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
p spin_words("This is a test") == "This is a test"
p spin_words("This is another test") == "This is rehtona test"
