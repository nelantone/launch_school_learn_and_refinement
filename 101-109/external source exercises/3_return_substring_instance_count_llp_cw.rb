# 3.Return substring instance count
# (https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby)
# 7 kyu
=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text
is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1
=end

def solution(string, match)
  string.scan(match).count
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('aaabbbcccc', 'bbb') == 1
