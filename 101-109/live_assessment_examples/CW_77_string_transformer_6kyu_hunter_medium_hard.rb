# Given a string, return a new string that has transformed based on the input:

# Change case of every character, ie. lower case to upper case, upper case to lower case.
# Reverse the order of words from the input.
# Note: You will have to handle multiple spaces, and leading/trailing spaces.

# For example:

#"Example Input" ==> "iNPUT eXAMPLE"
#You may assume the input only contain English alphabet and spaces.


=begin
* Problem understanding:
  - Mental model:
    - Change the case of every character (lower case to upper case, upper case to lower case.)
    - Reverse the order of words from the input.
  - Input: string

  - Output:string

  - Rules:
    - Explicit:
      -  You will have to handle multiple spaces, and leading/trailing spaces.

    - Implicit:
        -

  - Questions:

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - initialize change cases array
    - we will revere the words buet keeping the spaces
      - initialize a result array
      - separate the words and spaces also as a block of words(with chars we have each char counting spaces as chars
      - if the char before is a non space char
      - reverse the array object and join the chars
    - we will check if the words are upcased or downcased and we will do upcase the downcased and biceversa
        - if the char is the same upcased then is upcased.
        - otherwise downcase it.

  - Ideas:

  - Higher Level Algorithm(helper methods):
    -  revert the words

* Code:
=end

def split_words_and_spaces(str)
  str.split(/ /)
end

# p split_words_and_spaces("You Know When  THAT  Hotline Bling") == ["You", "Know", "When", "  ", "THAT", "  ", "Hotline"]
# p split_words_and_spaces(" Example Input")

def reverse_words_keeping_spaces(string)
  words_and_spaces = split_words_and_spaces(string)
  words_and_spaces.reverse.join(' ')
end

def upcased?(char)
  char.upcase == char
end

# p reverse_words("Example Input") == "Input Example"

def string_transformer(string)
  words_reversed = reverse_words_keeping_spaces(string)
  change_cases = []

  words_reversed.each_char do |char|
    if upcased?(char)
       change_cases << char.downcase
    else
      change_cases  << char.upcase
    end
  end
  result = change_cases.join
  if string[-1] == ' '
    result.chars.unshift(' ').join
  else
    result
  end
end

p string_transformer("Example Input")  == "iNPUT eXAMPLE"
p string_transformer(" Example Input") == "iNPUT eXAMPLE "
p string_transformer("Example Input ") == " iNPUT eXAMPLE"
p string_transformer("You Know When  THAT  Hotline Bling") == "bLING hOTLINE  that  wHEN kNOW yOU"