# Double Char (Part 1)
# Write a method that takes a string, and returns a new string in which every
# character is doubled.

# Examples:
=begin
every char is doubled
=end

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

# Double Char (Part 2)
# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled.

# rules: Vowels (a,e,i,o,u), digits, punctuation,and whitespace
# should not be doubled.

# Examples:
def double_consonants(str)
  str.chars.map { |char| char.match?(/[aeiou|\d|\W]/) ? char : char * 2 }.join
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

# Reverse the Digits In a Number
# Write a method that takes a positive integer as an argument and returns
# that number with its digits reversed. Examples:

def reversed_number(num)
  num.to_s.reverse.to_i
end
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

# Don't worry about arguments with leading zeros - Ruby sees those as octal
# numbers, which will cause confusing results. For similar reasons, the return
# value for our fourth example doesn't have any leading zeros.

##########################################

# Get The Middle Character
# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument. If the argument has an odd length,
# you should return exactly one character. If the argument has an even length,
# you should return exactly two characters.

# Examples:

def center_of(str)
  middle_val = str.size / 2

  str.size.odd? ? str[middle_val] : str[middle_val - 1, 2]
end

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
