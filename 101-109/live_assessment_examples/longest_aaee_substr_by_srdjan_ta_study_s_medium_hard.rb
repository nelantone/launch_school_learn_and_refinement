# 6 kyu easy
# 5 kyu hard

# see edge cases, test cases in detail.


###########

# Find the length of the longest substring in the given string that contains exatly 2 characters "a" and 2 characters "e" in it.

# As an example, if the input was “aaee”, the substring (aaee) length would be 4.
# For a string "babanctekeaa", the longest substring is "babancteke" and its length is 10.

# If the length of the input string is 0, return value must be -1 and if none of the substrings contain 2 "a" and "e" characters return -1 as well.


=begin
* Problem understanding:
  - Mental model:
   - find the longest substring in the string that contains exactli 2 chars 'a' and 2 chars 'e' in it.

  - Input: str

  - Output: int

  - Rules:
    - Explicit:
      - If the length of the input string is 0, return value must be -1
      - if none of the substrings contain 2 "a" and "e" characters return -1 as well.
    - Implicit:

  - Questions:

* Examples:

* Data Structure:
    - array? or str

* Algorithm:
** re-write
  - Main Algorithm:
    - find if there are aa and ee in the string otherwise return -1
    - in case there are find the size of the substring until that point and return the size

  - Ideas:

  - Methods to use:
    - Basic methods:
      - iterate with while until we count a and e twice
      - count

    - Direct methods:

  - Apporach:

  - Higher Level Algorithm(helper methods):

* Code:
=end

def find_ae_substrings(str)
  substrings = []

  4.upto(str.size) do |num|
    str.chars.each_cons(num) { |cons| substrings << cons.join }
  end

  substrings.select { |substring| substring.count('e') == 2 && substring.count('a') == 2 }
end

# p find_substrings("aaeedd") == ["aaee", "aaeed", "aeedd", "aaeedd"]

def longest_ae(str)
  ae_substrings = find_ae_substrings(str)

  return -1 if ae_substrings.empty?

  ae_substrings.max_by(&:size).size
end

p longest_ae("aaee") == 4
p longest_ae("babanctekeaa") == 10
p longest_ae("xenoglossophobia") == -1
p longest_ae("pteromerhanophobia") == 18
p longest_ae("johannisberger") == -1
p longest_ae("secaundogenituareabb") == 16


# "aaeedd"  -> [aaee. aaeed. aaeedd, aeed, aeedd, eedd]

# def longest_ae(str)
#   return -1 if str.size == 0

#   all_subs = all_substrings(str)

#   return -1 if all_subs.empty?

#   find_maximum
# end

# def find_maximum(arr)
#   arr.max_by {|substring| substring.size}.size
# end