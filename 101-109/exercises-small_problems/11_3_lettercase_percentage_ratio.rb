# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the
# number of uppercase and lowercase characters, as well as characters that
# were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains
# 3 entries: one represents the percentage of characters in the string that
# are lowercase letters, one the percentage of characters that are uppercase
# letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.
=begin
- Problem understanding:
  - mental model: give the percent of a string dividing in lowercase, uppercase,
    and others in a hash
  - input: string
  - output: hash
  - rules:
    - explicit:
      - string will always contain at least one character
    - implicit:
      - percent is shown as floats from 0 to 100
- Examples(below)
- Data structure:
  hash
- Algorithm:
    - scan the 3 different solutions inside an each with object hash
    scan [a-z]
    scan [A-Z]
    scan [^a-z]/i
    divide per total size
- Code
=end

def percent(dividend, divisor)
  result = (dividend / divisor.to_f) * 100
  result.round(2)
end

def letter_percentages(string)
  percent_hsh = {}
  lowercase   = string.scan(/[a-z]/)
  uppercase   = string.scan(/[A-Z]/)
  neither     = string.scan(/[^a-z]/i)

  percent_hsh[:lowercase] = percent(lowercase.size, string.size)
  percent_hsh[:uppercase] = percent(uppercase.size, string.size)
  percent_hsh[:neither]   = percent(neither.size, string.size)

  percent_hsh
end

# Examples
letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
letter_percentages('abcdefGHI') == { lowercase: 66.67, uppercase: 33.33, neither: 0 }
