# Capitalize Words

# Write a method that takes a single String argument and returns a new
# string that contains the original value of the argument with the first
# character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Swap Case
# Write a method that takes a string as an argument and returns a new string
# in which every uppercase letter is replaced by its lowercase version,
# and every lowercase letter by its uppercase version. All other characters
# should be unchanged.

# You may not use String#swapcase; write your own version of this method.
UPCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

# def swapcase(string)
#   string.chars.map do |char|
#     if UPCASE.include?(char)
#      char.downcase
#     elsif LOWERCASE.include?(char)
#       char.upcase
#     else
#       char
#     end
#   end.join
# end

# or

def swapcase(string)
  string.chars.map { |c| c.upcase == c ? c.downcase : c.upcase }.join
end

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
