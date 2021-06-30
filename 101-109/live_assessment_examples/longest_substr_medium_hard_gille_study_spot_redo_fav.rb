# Given a string s, find the length of the longest substring without repeating characters.
# Example 1:
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.
# Example 2:
# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
# Example 3:
# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
# Example 4:
# Input: s = ""
# Output: 0

=begin
- Problem understanding
 - mental model: find the length of the longes substring without repeating chars
 - input: string
 - output: integer
 - rules
  - explicit:
    - stop counting when there is one repetated char
  - implicit:
    - all are downcase chars from alphabet
    - can be also an empty string(then is 0 in this case)
- Examples
  "abc"...abcbb"=> ('abc'=> size) 3
- Data structure:
  - ary?
- Algorithm
  - Ideas:
    - stop process when a letter is present saving all elements in a new array
  - Algorithm
    - initialize a new empty string
    - see if the element of the char is present in the string adding items while iterating.
    - growing the number of the items as an array and count the total when there is a repeated num otherwise return the total size.
  - High level algorithm(helper methods)
- Code:
=end

def substring_candidates(str)
  ary_accumulator = ''
  candidates      = []

  str.size.times do |idx|
    if ary_accumulator.include? str[idx]
      candidates << ary_accumulator.size
      ary_accumulator = ''
    end
    ary_accumulator << str[idx]
  end
  candidates
end

def longest_substr(str)
  return 0 if str.empty?
  substring_candidates(str).max
end

p longest_substr("abcabcbb") == 3
p longest_substr("bbbbb") == 1
p longest_substr("pwwkew") == 3
p longest_substr("") == 0

# def longest_substr(str)
#   return 0 if str.empty?

#   poss = []
#   counter = 1

#   loop do
#     str.chars.each_cons(counter){|sub_arr| poss << sub_arr}
#     break if counter == str.length
#     counter += 1
#   end
#   selected = poss.select do |sub_arr|
#     sub_arr.sort == sub_arr.uniq.sort
#   end

#   selected.map{|sub_arr| sub_arr.length}
# end
