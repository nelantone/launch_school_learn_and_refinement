# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains
# 3 entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.
=begin
- Problem understanding
  - input: string
  - output: hash with 3 key,values
  - rules:
    - 3 entries:
      - 1: lowercase char
      - 2: uppercase char
      - 3: other chars(include everything as spaces, numbers signs, etc.. )

- Examples: below

- Data struct:
  - hash

- Algorithm:
  1. initialize an hash with lowercase, uppercase, neither as keys and 0 as
  value.

  2. initialize a variable assigned to an array #chars method invoked on string
  caller to convert the string to an array of each character as object.

  3. iterate to the chars_array using conditionals inside the block

    inside the block,
    3.1 if the char is uppercase add += 1 to hash[:uppercase]
    3.2 if the char is lowercase add += 1 to hash[:lowercase]
    3.2 if the char is neither add += 1 to hash[:neither]

  4. return the hash
- Code
=end

def letter_case_count(string)
  char_counter = {}

  char_counter[:lowercase] = string.scan(/[a-z]/).count
  char_counter[:uppercase] = string.scan(/[A-Z]/).count
  char_counter[:neither]   = string.scan(/[^a-z]/i).count

  char_counter
end

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
