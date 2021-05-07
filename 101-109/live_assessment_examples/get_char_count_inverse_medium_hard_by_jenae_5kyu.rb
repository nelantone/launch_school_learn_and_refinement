# Write a method that takes a string as an argument and groups the number of times
# each character appears in the string as a hash sorted by the highest number of occurrences.

# The characters should be sorted alphabetically e.g:

# get_char_count("cba") => {1=>["a", "b", "c"]}
# You should ignore spaces, special characters and count uppercase letters as lowercase ones.



=begin
* Problem understanding:
  - Mental model:
    - sort and group in a hash the times a char is appering in an array, as key-count-times,  values as an array

  - Input: string

  - Output: array

  - Rules:
    - Explicit:
      - ignore spaces, special characters and count uppercase letters as lowercase ones.
    - Implicit:
      -

  - Questions:

* Examples:

* Data Structure:
    - array?

* Algorithm:
  - Main Algorithm:
    + remove all special chars,spaces and downcase the arr
    + find all chars count each of them
    + count the chars save them into a hash
    + convert the char-keys in char-values and count-values in count-keys
    + sort the count-values

  - Higher Level Algorithm(helper methods):

* Code:
=end




def number_or_alpha?(char)
  char.match?(/[a-z]|[1-9]/)
end

def filtered_tally(str)
  result = []
  downcased_str = str.downcase

  downcased_str.each_char { |char| result << char if number_or_alpha?(char) }
  result.tally.to_a
end

def get_char_count(str)
  result ={}
  tally_hash = filtered_tally(str)

  tally_hash.each do |char_size|
    char = char_size.first
    size = char_size.last

    result[size].nil? ? result[size] = [char] : result[size] <<  char
  end
  result = result.map {|count, chars| [count, chars.sort] }

  result.sort.reverse.to_h
end

# p number_or_alpha?('!') == false
# p number_or_alpha?(' ') == false
# p number_or_alpha?('1') == true
# p number_or_alpha?('a') == true
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}