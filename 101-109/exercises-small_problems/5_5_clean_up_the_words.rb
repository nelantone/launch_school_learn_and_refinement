# Given a string that consists of some words (all lowercased) and an assortment
# of non-alphabetic characters, write a method that returns that string with all
# of the non-alphabetic characters replaced by spaces. If one or more
# non-alphabetic characters occur in a row, you should only have one space in
# the result (the result should never have consecutive spaces).

# Examples:

def cleanup(string)
  string.chars.map { |char| ('a'..'z').include?(char) ? char : ' ' }.join.squeeze(' ')
end

cleanup("---what's my +*& line?") == ' what s my line '

# or
# def cleanup(string)
#   char_array = string.chars

#   char_array.map! { |char| ('a'..'z').include?(char) ? char : ' ' }
#   char_array.join.squeeze(' ')# `\s` is any whitespace character & `+` 1 or more in `regex`
# end
